# SPDX-License-Identifier: Apache-2.0
#
# The OpenSearch Contributors require contributions made to
# this file be licensed under the Apache-2.0 license or a
# compatible open source license.

# frozen_string_literal: true

require_relative 'spec_hash'
require_relative './components/namespace'
require_relative './generators/action_generator'
require_relative './generators/api_generator'
require_relative './generators/client_generator'

# Generate API endpoints for OpenSearch Ruby client
class Generator
  # @return [Pathname] API Folder where the generated API files will be stored
  attr :api_folder

  # @param [String] spec_path location of the OpenSearch API spec file
  # @param [String] gem_folder location of the root folder of the OpenSearch Ruby Gem
  def initialize(spec_path, gem_folder = '../')
    @gem_folder = Pathname(gem_folder)
    SpecHash.load_file(spec_path)
  end

  def generate
    make_folders
    generate_apis
  end

  def make_folders
    action_folder = @gem_folder.join('lib', 'opensearch', 'api', 'actions')
    recreate_folder action_folder
    Namespace.namespaces.filter { |ns| !ns.root }.each do |namespace|
      recreate_folder action_folder.join(namespace.name)
    end
  end

  def generate_apis
    Namespace.namespaces.each do |namespace|
      namespace.actions.each do |action|
        ActionRenderer.new(@gem_folder, namespace, action).generate
      end
    end
    ApiGenerator.new(@gem_folder).generate
    ClientGenerator.new(@gem_folder, Namespace.namespaces).generate
  end

  private

  def recreate_folder(pathname)
    pathname.rmtree if pathname.exist?
    pathname.mkpath
  end
end
