# SPDX-License-Identifier: Apache-2.0
#
# The OpenSearch Contributors require contributions made to
# this file be licensed under the Apache-2.0 license or a
# compatible open source license.

# frozen_string_literal: true

require_relative 'operation'
require_relative 'version'
require_relative 'parameter'

# A collection of operations that comprise a single API Action
class Action
  attr_reader :group, :name, :namespace, :http_verbs, :urls, :description, :external_docs,
              :parameters, :path_params, :query_params,
              :body, :body_description, :body_required

  # @param [Array<Operation>] operations
  def initialize(operations)
    @operations = operations
    @group = operations.first.group
    @name = operations.first.action
    @namespace = operations.first.namespace
    @http_verbs = operations.map(&:http_verb).uniq
    @urls = operations.map(&:url).uniq
    @description = operations.map(&:description).find(&:present?)
    @external_docs = operations.map(&:external_docs).find(&:present?)
    @external_docs = nil if @external_docs == 'https://opensearch.org/docs/latest'

    dup_params = operations.flat_map(&:parameters)
    @path_params = dup_params.select { |p| p.in == 'path' }
    path_param_names = @path_params.map(&:name).to_set
    @query_params = dup_params.select { |p| p.in == 'query' && !path_param_names.include?(p.name) }
    @parameters = @path_params + @query_params
    @parameters.each { |p| p.spec.node_data['required'] = p.name.in?(required_components) }

    @body = operations.map(&:request_body).find(&:present?)
    @body_required = 'body'.in?(required_components)
    @body_description = @body&.content&.[]('application/json')&.schema&.description if @body.present?
  end

  # @return [Set<String>] The names of input components that are required by the action.
  # A component is considered required if it is required by all operations that make up the action.
  def required_components
    @required_components ||= @operations.map do |op|
      set = Set.new(op.parameters.select(&:required?).map(&:name))
      set.add('body') if op.request_body&.required?
      set
    end.reduce(&:intersection)
  end
end
