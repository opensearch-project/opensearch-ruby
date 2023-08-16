# SPDX-License-Identifier: Apache-2.0
#
# The OpenSearch Contributors require contributions made to
# this file be licensed under the Apache-2.0 license or a
# compatible open source license.

# frozen_string_literal: true

require_relative 'base_generator'
require_relative 'action'

# Generate Spec test for an API Action via Mustache
class SpecGenerator < BaseGenerator
  self.template_file = './templates/spec.mustache'
  attr_reader :action, :http_verb

  delegate :namespace, :name, to: :action

  # @param [Pathname] output_folder
  # @param [Action] action
  def initialize(output_folder, action)
    super(output_folder)
    @action = action
    @http_verb = action.http_verbs.min.upcase
  end

  def expected_url_path
    action.urls.max_by(&:length).split('/').select(&:present?).map do |component|
      next component unless component.start_with?('{')
      param = action.path_params.find { |p| p.name == component[/{(.+)}/, 1] }
      param.expected_path_value
    end.join('/')
  end

  def expected_query_params
    action.query_params.map do |p|
      { pre: '  ',
        key: p.name,
        value: p.expected_query_value,
        post: ',' }
    end.tap do |params|
      params.first&.update(pre: '{ ')
      params.last&.update(post: ' },')
    end
  end

  def body
    return '{}' if action.required_components.include?('body')
    return 'nil' if action.body.nil?
    http_verb.in?(%w[PUT POST PATCH]) ? '{}' : 'nil'
  end

  def required_components
    action.required_components.map do |component|
      { arg: component,
        others: other_required_components(component) }
    end
  end

  def client_double_args
    args = (action.path_params + action.query_params).map { |p| { key: p.name, value: p.client_double_value } }
    args += [{ key: 'body', value: '{}' }] unless body == 'nil'
    args.last&.update(last: true)
    args
  end

  private

  def other_required_components(component)
    others = action.required_components.reject { |c| c == component }.map do |c|
      "#{c}: #{arg_value(c)}"
    end.join(', ')
    "(#{others})" unless others.empty?
  end

  def arg_value(component)
    return body if component == 'body'
    action.path_params.find { |p| p.name == component }&.client_double_value
  end

  def output_file
    create_folder(*[@output_folder, @action.namespace].compact).join("#{@action.name}_spec.rb")
  end
end
