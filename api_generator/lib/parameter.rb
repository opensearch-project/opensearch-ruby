# SPDX-License-Identifier: Apache-2.0
#
# The OpenSearch Contributors require contributions made to
# this file be licensed under the Apache-2.0 license or a
# compatible open source license.

# frozen_string_literal: true

require 'openapi3_parser/node/parameter'
require_relative 'version'

# Wrapper for Openapi3Parser::Node::Parameter that adds extra info unique to OpenSearch
class Parameter < Openapi3Parser::Node::Parameter
  attr_reader :spec, :type, :ruby_type, :is_array, :default, :deprecated

  # @param [Openapi3Parser::Node::Parameter] spec Parameter Spec
  def initialize(spec)
    super(spec.node_data, spec.node_context)
    @spec = spec
    @type = schema&.[]('x-data-type') || schema&.type
    @ruby_type = @type.capitalize
    @is_array = schema&.type == 'array'
    @default = schema&.default
    @deprecated = schema&.deprecated? == true
  end

  # @return [any] example value for this parameter
  def example_value
    return 'songs' if type == 'string'
    return 42 if type == 'integer'
    return true if type == 'boolean'
    return %w[books movies] if type == 'array'
    return '1m' if type == 'time'
    raise "Unknown type #{type}"
  end

  # @return [String] value to be interpolated into the url path to be passed to the transport layer
  def expected_path_value
    type == 'array' ? example_value.join(',') : example_value.to_s
  end

  # @return [any] query value to be passed to the transport layer
  def expected_query_value
    return "'#{example_value}'" if type.in?(%w[string time])
    return "'#{example_value.join(',')}'" if type == 'array'
    example_value
  end

  # @return [any] value to be passed to the client in the spec
  def client_double_value
    return "'#{example_value}'" if type.in?(%w[string time])
    return "%w[#{example_value.join(' ')}]" if type == 'array'
    example_value
  end
end
