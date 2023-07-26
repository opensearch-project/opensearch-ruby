# SPDX-License-Identifier: Apache-2.0
#
# The OpenSearch Contributors require contributions made to
# this file be licensed under the Apache-2.0 license or a
# compatible open source license.

# frozen_string_literal: true

require 'openapi3_parser'
require_relative 'base_generator'

# Generate the index file via Mustache
class IndexGenerator < BaseGenerator
  self.template_file = './templates/index.mustache'

  def initialize(output_folder, namespaces)
    @namespaces = namespaces.compact
    super(output_folder)
  end

  def legacy_license_header
    Pathname('./templates/legacy_license_header.txt').read
  end

  def namespace_modules
    modules = @namespaces.to_a.sort.map do |namespace|
      { name: "OpenSearch::API::#{namespace.camelcase}", comma: ',' }
    end
    modules.last[:comma] = ''
    modules
  end

  private

  def output_file
    create_folder(@output_folder).join('api.rb')
  end
end
