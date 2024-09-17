# SPDX-License-Identifier: Apache-2.0
#
# The OpenSearch Contributors require contributions made to
# this file be licensed under the Apache-2.0 license or a
# compatible open source license.

# frozen_string_literal: true

require_relative 'action'
require_relative 'operation'

# A collection of API actions that comprise a single API Namespace
class Namespace
  # @return [String] Namespace name
  attr_reader :name
  # @return [Array<Action>] Actions in the namespace
  attr_reader :actions
  # @return [Boolean] whether this is the root namespace
  attr_reader :root

  # @param [Array<Action>] actions
  def initialize(actions)
    @name = actions.first&.namespace || ''
    @actions = actions
    @root = name == ''
  end

  # @param [SpecHash] Parsed OpenAPI spec
  def self.set_namespaces(spec)
    operations = spec.paths.flat_map do |url, ops|
      ops.filter_map { |verb, op| Operation.new(op, url, verb) unless op['x-ignorable'] }
    end
    actions = operations.group_by(&:group).values.map { |ops| Action.new(ops) }
    @namespaces = actions.group_by(&:namespace).values.map { |acts| Namespace.new(acts) }
  end


  # @return [Array<Namespace>] Namespaces
  def self.namespaces
    raise 'Namespaces not set' unless @namespaces
    @namespaces
  end
end
