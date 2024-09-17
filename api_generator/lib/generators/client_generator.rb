# SPDX-License-Identifier: Apache-2.0
#
# The OpenSearch Contributors require contributions made to
# this file be licensed under the Apache-2.0 license or a
# compatible open source license.

# frozen_string_literal: true

require_relative 'base_generator'
require_relative '../components/argument'

# Generate the index file via Mustache
class ClientGenerator < BaseGenerator
  self.template_file = './lib/templates/client.mustache'
  attr_reader :namespaces

  # @param [Pathname] gem_folder
  # @param [Array<Namespace>] namespaces
  def initialize(gem_folder, namespaces)
    super(gem_folder.join('lib', 'opensearch.rb'))
    @namespaces = namespaces.filter { |ns| !ns.root }
                            .map(&:name)
                            .sort
                            .map { |name| { name: name, module: name.camelcase } }
    @namespaces.push(name: 'http', module: 'Http')
  end
end
