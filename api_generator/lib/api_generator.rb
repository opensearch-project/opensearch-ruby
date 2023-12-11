# SPDX-License-Identifier: Apache-2.0
#
# The OpenSearch Contributors require contributions made to
# this file be licensed under the Apache-2.0 license or a
# compatible open source license.

# frozen_string_literal: true

require 'openapi3_parser'
require_relative 'action'
require_relative 'action_generator'
require_relative 'spec_generator'
require_relative 'namespace_generator'
require_relative 'index_generator'
require_relative 'low_level_action_generator'

# Generate API endpoints for OpenSearch Ruby client
class ApiGenerator
  HTTP_VERBS = %w[get post put patch delete patch head].freeze

  # @param [String] openapi_spec location of the OpenSearch API spec file [required]
  def initialize(openapi_spec)
    @spec = Openapi3Parser.load_file(openapi_spec)
  end

  # Generate API methods from the OpenSearch Specs.
  # @param [String] gem_folder location of the API Gem folder (default to the parent folder of the generator)
  # @param [String] version target OpenSearch version to generate like "2.5" or "3.0"
  # @param [String] namespace namespace to generate (Default to all namespaces. Use '' for root)
  # @param [Array<String>] actions list of actions in the specified namespace to generate (Default to all actions)
  def generate_spec_methods(gem_folder = '../', version: nil, namespace: nil, actions: nil)
    gem_folder = Pathname gem_folder
    namespaces = existing_namespaces(gem_folder)
    target_actions(version, namespace, actions).each do |action|
      ActionGenerator.new(gem_folder.join('lib/opensearch/api/actions'), action).generate
      SpecGenerator.new(gem_folder.join('spec/opensearch/api/actions'), action).generate
      NamespaceGenerator.new(gem_folder.join('lib/opensearch/api/namespace'), action.namespace).generate(namespaces)
    end
    IndexGenerator.new(gem_folder.join('lib/opensearch'), namespaces).generate
  end

  # Generate basic HTTP methods that are independent of the OpenSearch Specs.
  # @param [String] gem_folder location of the API Gem folder (default to the parent folder of the generator)
  def generate_static_methods(gem_folder = '../')
    gem_folder = Pathname gem_folder
    namespaces = existing_namespaces(gem_folder)
    low_level_namespace = 'http'

    NamespaceGenerator.new(gem_folder.join('lib/opensearch/api/namespace'), low_level_namespace).generate(namespaces)
    LowLevelBaseActionGenerator.new(gem_folder.join('lib/opensearch/api/actions'), low_level_namespace).generate
    IndexGenerator.new(gem_folder.join('lib/opensearch'), namespaces).generate

    %w[head get post put patch delete options trace connect].each do |action|
      LowLevelActionGenerator.new(gem_folder.join('lib/opensearch/api/actions'), low_level_namespace, action).generate
    end
  end

  private

  def target_actions(version, namespace, actions)
    namespace = namespace.to_s
    actions = Array(actions).map(&:to_s).to_set unless actions.nil?

    operations = @spec.paths.flat_map do |url, path|
      path.to_h.slice(*HTTP_VERBS).compact.map do |verb, operation_spec|
        operation = Operation.new operation_spec, url, verb
        operation.part_of?(version, namespace, actions) ? operation : nil
      end
    end.compact

    operations.group_by(&:group).values.map { |ops| Action.new ops }
  end

  def existing_namespaces(gem_folder)
    gem_folder.join('lib/opensearch/api/actions').children.select(&:directory?).map(&:basename).map(&:to_s).to_set
  end
end
