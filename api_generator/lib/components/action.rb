# SPDX-License-Identifier: Apache-2.0
#
# The OpenSearch Contributors require contributions made to
# this file be licensed under the Apache-2.0 license or a
# compatible open source license.

# frozen_string_literal: true

require_relative 'argument'

# A collection of operations that comprise a single API Action
# AKA operation-group
class Action
  # @return [Array<Operation>] Operations in the action
  attr_reader :operations

  # @param [Array<Operation>] operations
  def initialize(operations)
    @operations = operations
    @operation = operations.first
    @spec = @operation&.spec
  end

  # @return [Array<Argument>] Input arguments.
  def arguments; @arguments ||= Argument.from_operations(@operations.map(&:spec)); end

  # @return [Argument, NilClass] Request Body argument
  def body; @body ||= arguments.find { |arg| arg.name == 'body' }; end

  # @return [Array<Argument>] Path Param arguments
  def path_params; @path_params ||= arguments.select { |arg| arg.location == 'path' }; end

  # @return [Array<Argument>] Query Param arguments
  def query_params; @query_params ||= arguments.select { |arg| arg.location == 'query' }; end

  # @return [String] Full name of the action (i.e. x-operation-group)
  def full_name; @operation&.group; end

  # return [String] Name of the action
  def name; @operation&.action; end

  # @return [String] Namespace of the action
  def namespace; @operation&.namespace; end

  # @return [Array<String>] Sorted unique HTTP verbs
  def http_verbs; @operations.map(&:http_verb).uniq.sort; end

  # @return [Array<String>] Unique URLs
  def urls; @operations.map(&:url).uniq; end

  # @return [String] Description of the action
  def description; @spec&.description || ''; end

  # @return [Boolean] Whether the action is deprecated
  def deprecated; @spec&.deprecated || false; end

  # @return [String] Deprecation message
  def deprecation_message; @spec['x-deprecation-message']; end

  # @return [String, NilClass] API reference
  def api_reference; @operation&.spec&.external_docs&.url; end
end
