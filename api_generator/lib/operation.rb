# SPDX-License-Identifier: Apache-2.0
#
# The OpenSearch Contributors require contributions made to
# this file be licensed under the Apache-2.0 license or a
# compatible open source license.

# frozen_string_literal: true

require 'openapi3_parser'
require 'openapi3_parser/node/operation'
require_relative 'version'
require_relative 'parameter'

# Wrapper for Openapi3Parser::Node::Operation that adds extra info unique to OpenSearch
class Operation < Openapi3Parser::Node::Operation
  attr_reader :url, :http_verb, :group, :action, :namespace,
              :version_added, :version_removed, :version_deprecated, :external_docs

  # @param [Openapi3Parser::Node::Operation] spec Operation Spec
  # @param [String] url
  # @param [String] http_verb
  def initialize(spec, url, http_verb)
    super(spec.node_data, spec.node_context)
    @url = url
    @http_verb = http_verb
    @group = spec['x-operation-group']
    @action, @namespace = @group.split('.').reverse
    @version_added = Version.new(spec['x-version-added'] || '0.0.0')
    @version_removed = Version.new(spec['x-version-removed'] || '999.999.999')
    @version_deprecated = Version.new spec['x-version-deprecated']
    @external_docs = spec['externalDocs']&.[]('url')
  end

  # @return [Array<Parameter>] collection of path and query parameters
  def parameters
    @parameters ||= super.map { |p| Parameter.new(p) }
  end

  # @param [String] version is the operation part of this version?
  # @param [String, NilClass] namespace is the operation part of this namespace?
  # @param [Set<String>, NilClass] actions is the operation part of any of these actions?
  def part_of?(version, namespace, actions)
    version = Version.new(version)
    part_of_version = version.nil? || (version_added <= version && version < version_removed)
    part_of_namespace = namespace.nil? || @namespace == namespace || (@namespace.nil? && namespace == '')
    part_of_actions = actions.nil? || actions.include?(action)
    part_of_version && part_of_namespace && part_of_actions
  end
end
