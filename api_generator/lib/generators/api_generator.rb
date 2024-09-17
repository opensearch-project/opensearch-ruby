# SPDX-License-Identifier: Apache-2.0
#
# The OpenSearch Contributors require contributions made to
# this file be licensed under the Apache-2.0 license or a
# compatible open source license.

# frozen_string_literal: true

require_relative 'base_generator'
require_relative '../components/argument'

# Generate the API index file
class ApiGenerator < BaseGenerator
  self.template_file = './lib/templates/api.mustache'

  # @param [Pathname] gem_folder
  def initialize(gem_folder)
    super(gem_folder.join('lib', 'opensearch', 'api.rb'))
  end

  def global_query_params
    max_length = Argument.global.map { |arg| arg.name.length }.max
    Argument.global.map do |arg|
      { name: arg.name,
        description: arg.description,
        space: ' ' * (max_length - arg.name.length + 4),
        comma: ',' }
    end.tap { |args| args.last[:comma] = ' ' }
  end
end
