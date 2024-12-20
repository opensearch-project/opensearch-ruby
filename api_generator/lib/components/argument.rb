# SPDX-License-Identifier: Apache-2.0
#
# The OpenSearch Contributors require contributions made to
# this file be licensed under the Apache-2.0 license or a
# compatible open source license.

# frozen_string_literal: true

# Represents an argument to an API action
class Argument
  # @return [String] The name of the argument
  attr_reader :name
  # @return [String] The description of the argument
  attr_reader :description
  # @return [Boolean] Whether the argument is required
  attr_reader :required
  # @return [SpecHash] The JSON schema of the argument
  attr_reader :schema
  # @return [String] Argument type in Ruby
  attr_reader :type
  # @return [String] The default value of the argument
  attr_reader :default
  # @return [Boolean] Whether the argument is deprecated
  attr_reader :deprecated
  # @return [String] The deprecation message
  attr_reader :deprecation_message
  # @return [ArgLocation] The location of the argument
  attr_reader :location

  def initialize(name:, description:, required:, schema:, default:, deprecated:, deprecation_message:, location:)
    @name = name
    @description = description
    @required = required
    @schema = schema
    @type = get_ruby_type(schema)
    @default = default
    @deprecated = deprecated
    @deprecation_message = deprecation_message
    @location = location
  end

  # @param [SpecHash | nil] schema
  # @return [String | nil] Ruby type
  def get_ruby_type(schema)
    return nil if schema.nil?
    union = schema.anyOf || schema.oneOf
    return union.map { |sch| get_ruby_type(sch) }.uniq.sort.join(', ') unless union.nil?
    return 'Integer' if schema.type == 'integer'
    return 'Float' if schema.type == 'number'
    return 'Boolean' if schema.type == 'boolean'
    return 'String' if schema.type == 'string'
    return 'NilClass' if schema.type == 'null'
    return "Enumerable<#{get_ruby_type(schema.items)}>" if schema.type == 'array'
    "Hash"
  end

  # @param [SpecHash] Full OpenAPI spec
  def self.set_global(spec)
    @global = spec.components.parameters.filter { |_, p| p['x-global'] }.map { |_, p| from_parameters([p], 1) }
  end

  # @return [Array<Argument>] Global arguments
  def self.global
    raise 'Global arguments not set' unless @global
    @global
  end

  # @param [Array<SpecHash>] operations
  # @return [Array<Argument>]
  def self.from_operations(operations)
    parameters = operations.flat_map(&:parameters).filter { |param| !param['x-global'] }
                           .group_by(&:name).values.map { |params| from_parameters(params, operations.size) }
    body = from_request_bodies(operations.map(&:requestBody))
    (parameters + [body]).compact
  end

  # @param [Array<SpecHash>] params
  # @param [Integer] opts_count
  # @return [Argument]
  def self.from_parameters(params, opts_count)
    param = params.first || SpecHash.new
    schema = param&.schema || SpecHash.new
    Argument.new(name: param.name,
                 description: param.description || schema.description,
                 required: params.filter(&:required).size >= opts_count,
                 schema: schema,
                 default: param['default'] || schema['default'],
                 deprecated: param.deprecated || schema.deprecated,
                 deprecation_message: param['x-deprecation-message'] || schema['x-deprecation-message'],
                 location: params.any? { |p| p.in == 'path' } ? 'path' : 'query')
  end

  # @param [Array<SpecHash>] bodies
  # @return [Argument | nil]
  def self.from_request_bodies(bodies)
    body = bodies.compact.find { |body| !body.nil? }
    return if body.nil?
    schema = body.content['application/json']&.schema || body.content['application/x-ndjson']&.schema || SpecHash.new
    Argument.new(name: 'body',
                 description: body.description || schema.description,
                 required: bodies.all?(&:required),
                 schema: schema,
                 default: nil,
                 deprecated: body.deprecated || schema.deprecated,
                 deprecation_message: body['x-deprecation-message'] || schema&.[]('x-deprecation-message'),
                 location: 'body')
  end
end
