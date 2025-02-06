# SPDX-License-Identifier: Apache-2.0
#
# The OpenSearch Contributors require contributions made to
# this file be licensed under the Apache-2.0 license or a
# compatible open source license.

# frozen_string_literal: true

require 'yaml'
require_relative 'components/namespace'
require_relative 'components/argument'

# Spec class for parsing OpenAPI spec
# It's basically a wrapper around a Hash that allows for accessing hash values as object attributes
# and resolving of $refs
class SpecHash
  def self.load_file(file_path)
    @raw = YAML.load_file(file_path)
    @parsed = SpecHash.new(@raw, parsed: false)
    Namespace.set_namespaces(@parsed)
    Argument.set_global(@parsed)
  end

  # @return [Hash] Raw OpenAPI Spec
  class << self; attr_reader :raw; end

  # @return [Spec] Parsed OpenAPI Spec
  class << self; attr_reader :parsed; end

  attr_reader :hash

  delegate :to_s, to: :hash

  # @param [Hash] hash
  def initialize(hash = {}, parsed: true)
    raise ArgumentError, "#{self.class} must be initialized with a Hash" unless hash.is_a?(Hash)
    @hash = parsed ? hash : parse(hash)
    @parsed_keys = Set.new
  end

  def to_s
    "<SpecHash: #{@hash.to_s}>"
  end

  def is_a?(klass)
    klass == SpecHash || super
  end

  def [](key)
    return @hash[key] if @parsed_keys.include?(key)
    @hash[key] = parse(@hash[key])
  end

  def respond_to_missing?(name, ...)
    @hash.key?(name.to_s) || {}.respond_to?(name) || super
  end

  def method_missing(name, ...)
    if {}.respond_to?(name)
      warn "Accessing Hash attribute `#{name}` which is also a key of the SpecHash instance." if @hash.key?(name.to_s)
      return @hash.send(name, ...)
    end
    self[name.to_s]
  end

  private

  def parse(value)
    return value.map { |v| parse(v) } if value.is_a?(Array)
    return value unless value.is_a?(Hash)
    ref = value.delete('$ref')
    value.transform_values! { |v| parse(v) }
    value.merge!(resolve(ref)) if ref
    SpecHash.new(value)
  end

  def resolve(ref)
    parts = ref.split('/')
    parts.shift
    self.class.raw.dig(*parts)
  end
end
