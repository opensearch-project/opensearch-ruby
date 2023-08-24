# SPDX-License-Identifier: Apache-2.0
#
# The OpenSearch Contributors require contributions made to
# this file be licensed under the Apache-2.0 license or a
# compatible open source license.
#
# Modifications Copyright OpenSearch Contributors. See
# GitHub history for details.
#
# Licensed to Elasticsearch B.V. under one or more contributor
# license agreements. See the NOTICE file distributed with
# this work for additional information regarding copyright
# ownership. Elasticsearch B.V. licenses this file to you under
# the Apache License, Version 2.0 (the "License"); you may
# not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.

require 'rspec/core/rake_task'
require 'rake/testtask'
require 'mkmf'

desc 'Generate documentation for preview'
task :gh_pages do
  yard_cmd = 'yard doc --embed-mixins --markup=rdoc --output-dir docs ./docs lib/**/*.rb'
  Kernel.system yard_cmd

  %w[OpenSearch.svg].each do |file|
    cp file, './docs'
  end
end

namespace :test do
  desc 'Run all tests'
  task :all do
    Rake::Task['test:unit'].invoke
    Rake::Task['test:integration'].invoke
  end

  desc 'Run all integration tests'
  task :integration do
    Rake::Task['test:api:integration'].invoke
    Rake::Task['test:dsl:integration'].invoke
    Rake::Task['test:transport:integration'].invoke
    Rake::Task['test:client:integration'].invoke
  end

  desc 'Run all unit tests'
  task :unit do
    Rake::Task['test:api:unit'].invoke
    Rake::Task['test:dsl:unit'].invoke
    Rake::Task['test:transport:unit'].invoke
    Rake::Task['test:client:unit'].invoke
  end

  namespace :api do
    desc 'Run all API unit tests'
    task unit: :unit_spec
    RSpec::Core::RakeTask.new(:unit_spec) do |t|
      t.pattern = 'spec/opensearch/api/**/*_spec.rb'
    end

    # TODO: Implement and Incorporate this task into github actions
    desc 'Run API integration tests'
    task integration: :integration_spec
    RSpec::Core::RakeTask.new(:integration_spec) do |t|
      t.pattern = 'spec/opensearch/api/**/*_integration_spec.rb' # Placeholder
    end

    desc 'Run API tests'
    task :all do
      Rake::Task['test:api:unit'].invoke
      Rake::Task['test:api:integration'].invoke
    end
  end

  namespace :dsl do
    RSpec::Core::RakeTask.new(:spec) do |t|
      t.pattern = 'spec/opensearch/dsl/**/*_spec.rb'
    end

    Rake::TestTask.new(:unit) do |test|
      test.libs << 'lib' << 'test'
      test.test_files = FileList['test/dsl/unit/**/*_test.rb']
      test.deps = [:spec]
      test.verbose = false
      test.warning = false
    end

    Rake::TestTask.new(:integration) do |test|
      test.libs << 'lib' << 'test'
      test.test_files = FileList['test/dsl/integration/**/*_test.rb']
      test.verbose = false
      test.warning = false
    end

    desc 'Run all DSL tests'
    task :all do
      Rake::Task['test:dsl:unit'].invoke
      Rake::Task['test:dsl:integration'].invoke
    end
  end

  namespace :transport do
    RSpec::Core::RakeTask.new(:transport_spec) do |t|
      t.pattern = 'spec/opensearch/transport/**/*_spec.rb'
    end

    RSpec::Core::RakeTask.new(:connections_spec) do |t|
      t.pattern = 'spec/opensearch/transport/**/*_spec.rb'
    end

    Rake::TestTask.new(:unit) do |test|
      test.libs << 'lib' << 'test'
      test.test_files = FileList['test/transport/unit/**/*_test.rb']
      test.verbose = false
      test.warning = false
    end

    Rake::TestTask.new(:integration) do |test|
      test.libs << 'lib' << 'test'
      test.test_files = FileList['test/transport/integration/**/*_test.rb']
      test.deps = %w[test:transport:transport_spec test:transport:connections_spec]
      test.verbose = false
      test.warning = false
    end

    desc 'Run all transport tests'
    task :all do
      Rake::Task['test:transport:unit'].invoke
      Rake::Task['test:transport:integration'].invoke
    end

    Rake::TestTask.new(:profile) do |test|
      test.libs << 'lib' << 'test'
      test.test_files = FileList['test/profile/**/*_test.rb']
    end
  end

  namespace :client do
    RSpec::Core::RakeTask.new(:integration) do |t|
      t.pattern = 'spec/opensearch/client/integration/security_disabled/**/*_spec.rb'
    end

    RSpec::Core::RakeTask.new(:unit) do |t|
      t.pattern = 'spec/opensearch/client/unit/**/*_spec.rb'
    end

    desc 'Run all client tests'
    task :all do
      Rake::Task['test:client:unit'].invoke
      Rake::Task['test:client:integration'].invoke
    end

    RSpec::Core::RakeTask.new(:security) do |t|
      t.pattern = 'spec/opensearch/client/integration/security_enabled/**/*_spec.rb'
    end
  end
end

require 'net/http'
require 'json'
require 'coderay'
namespace :generate do
  # TODO: This legacy task is currently not working because we don't have a search.opensearch.org site to crawl for docs
  desc <<-DESC.gsub(/^    /, '')
    Generate Ruby source and tests for query/filter/aggregation

    Pass the type of the component, the name, and any option methods as Rake task arguments.

    Example:

        $ rake generate:source[query,boosting]
        Source: /.../opensearch-ruby/opensearch-dsl/lib/opensearch/dsl/search/queries/boosting.rb
        ...
        Test: /.../opensearch-ruby/opensearch-dsl/test/unit/queries/boosting_test.rb
        ...

        $ rake generate:source[query,common,query/cutoff_frequency/low_freq_operator/...]
        Source: /.../opensearch-ruby/opensearch-dsl/lib/opensearch/dsl/search/queries/common.rb
        ...
        Test: /.../opensearch-ruby/opensearch-dsl/test/unit/queries/common_test.rb
        ...

  DESC
  task :dsl_source, [:type, :name, :option_methods] do |_tasks, options|
    unless ENV['NOCRAWL']
      begin
        query    = CGI.escape("#{options[:name]} #{options[:type]}")
        response = Net::HTTP.get('search.opensearch.org', "/search/?q=#{query}")
        hits     = JSON.parse(response)['hits']['hits']

        if (hit = hits.first) && (hit['_score'] > 0.2)
          doc_url = "http://opensearch.org#{hit['fields']['url']}".gsub(/#.+$/, '')
        end
      rescue StandardError => e
        puts "[!] ERROR: #{e.inspect}"
      end
    end

    case options[:type]
    when /query/
      module_name = 'Queries'
      path_name = 'queries'
      include_module = 'BaseComponent'
    when /filter/
      module_name = 'Filters'
      path_name = 'filters'
      include_module = 'BaseComponent'
    when /agg/
      module_name = 'Aggregations'
      path_name = 'aggregations'
      include_module = 'BaseAggregationComponent'
    else raise ArgumentError, "Unknown DSL type [#{options[:type]}]"
    end

    name = options[:name].downcase

    class_name = options[:name].split('_').map(&:capitalize).join

    option_methods = options[:option_methods].to_s.split('/').reduce('') do |sum, item|
      sum << '                '
      sum << "option_method :#{item}"
      sum << "\n" unless item == options[:option_methods].to_s.split('/').last
      sum
    end

    option_methods = "\n\n#{option_methods}" unless option_methods.empty?

    source = <<-RUBY.gsub(/^      /, '')
      module OpenSearch
        module DSL
          module Search
            module #{module_name}

              # #{class_name} #{options[:type]}
              #
              # @example
              #
              # @see #{doc_url}
              #
              class #{class_name}
                include #{include_module}#{option_methods}
              end

            end
          end
        end
      end
    RUBY

    if options[:option_methods].to_s.empty?
      test_option_methods = ''
    else
      setup = options[:option_methods].to_s.split('/').reduce('') do |sum, item|
        sum << "          subject.#{item} 'bar'\n"
        sum
      end
      setup = "\n#{setup}"
      asserts = "\n          assert_equal %w[ #{options[:option_methods].to_s.split('/').sort.join(' ')} ],\n                       subject.to_hash[:#{name}][:foo].keys.map(&:to_s).sort"
      asserts << "\n          assert_equal 'bar', subject.to_hash[:#{name}][:foo][:#{options[:option_methods].to_s.split('/').first}]"

      test_option_methods = <<-RUBY.gsub(/^        /, '')

        should "have option methods" do
          subject = #{class_name}.new :foo
          #{setup}#{asserts}
        end

        should "take a block" do
          subject = #{class_name}.new :foo do
            #{options[:option_methods].to_s.split('/').first} 'bar'
          end
          assert_equal({#{name}: { foo: { #{options[:option_methods].to_s.split('/').first}: 'bar' } }}, subject.to_hash)
        end
      RUBY
    end

    test = <<-RUBY.gsub(/^      /, '')
      require 'test_helper'

      module OpenSearch
        module Test
          module #{module_name}
            class #{class_name}Test < ::OpenSearch::Test::UnitTestCase
              include OpenSearch::DSL::Search::#{module_name}

              context "#{class_name} #{options[:type]}" do
                subject { #{class_name}.new }

                should "be converted to a Hash" do
                  assert_equal({ #{name}: {} }, subject.to_hash)
                end
                #{test_option_methods.empty? ? '' : test_option_methods.split("\n").map { |l| "                #{l}" }.join("\n")}
              end
            end
          end
        end
      end
    RUBY

    source_full_path = File.expand_path("../lib/opensearch/dsl/search/#{path_name}/#{name}.rb", __FILE__)
    test_full_path   = File.expand_path("../test/unit/#{path_name}/#{name}_test.rb", __FILE__)

    puts '-' * 80, "Source: #{source_full_path}", '-' * 80, "\n", CodeRay.scan(source, :ruby).terminal, "\n\n"
    puts '-' * 80, "Test: #{test_full_path}",     '-' * 80, "\n", CodeRay.scan(test,   :ruby).terminal, "\n"

    File.open(source_full_path, 'w') { |file| file << source }

    File.open(test_full_path, 'w') { |file| file << test }
  end
end
