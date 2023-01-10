# SPDX-License-Identifier: Apache-2.0
#
# The OpenSearch Contributors require contributions made to
# this file be licensed under the Apache-2.0 license or a
# compatible open source license.
#
# Modifications Copyright OpenSearch Contributors. See
# GitHub history for details.

require 'pathname'
require 'bundler/gem_helper'
require_relative '../opensearch-ruby/lib/opensearch/version'
require_relative '../opensearch-api/lib/opensearch/api/version'
require_relative '../opensearch-dsl/lib/opensearch/dsl/version'
require_relative '../opensearch-transport/lib/opensearch/transport/version'

# Generate Docs for Github Pages
class GithubPagesGenerator
  INDEX_FILE = 'index.md'
  GEMS = [
    { folder: 'opensearch', version: OpenSearch::VERSION, name: 'OpenSearch Ruby' },
    { folder: 'opensearch-dsl', version: OpenSearch::DSL::VERSION, name: 'OpenSearch DSL' },
    { folder: 'opensearch-api', version: OpenSearch::API::VERSION, name: 'OpenSearch API' },
    { folder: 'opensearch-transport', version: OpenSearch::Transport::VERSION, name: 'OpenSearch Transport' },
  ].freeze

  attr_reader :root, :index_file

  def initialize(root)
    @root = Pathname(root)
  end

  def generate(output_folder)
    @index_file =  root.join(output_folder, INDEX_FILE)
    index_file.delete if index_file.exist?
    generate_docs(output_folder)
    generate_index(output_folder)
  end

  private

  def generate_docs(output_folder)
    GEMS.each do |gem|
      minor_version = gem[:version].split('.')[0..1].join('.')
      output_dir = root.join(output_folder, gem[:folder], minor_version)
      yard_cmd = "yard doc --embed-mixins --markup=rdoc -o #{output_dir}"
      Kernel.system "cd #{root.join(gem[:folder])} && #{yard_cmd}"
    end
  end

  def generate_index(output_folder)
    docs = GEMS.map do |gem|
      gem_path = root.join(output_folder, gem[:folder])
      versions = gem_path.children.sort.reverse.map do |version_path|
        version = version_path.basename
        "- [#{version}.x](#{gem[:folder]}/#{version})"
      end

      ['', "### #{gem[:name]}:"] + versions
    end

    File.open(index_file, 'w') do |f|
      f.puts '## OpenSearch Ruby Documentation'
      f.puts 'Below is the list of all OpenSearch gems and their documentation:'
      f.puts docs
    end
  end
end
