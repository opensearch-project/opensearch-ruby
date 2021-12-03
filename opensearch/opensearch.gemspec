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

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'opensearch/version'

Gem::Specification.new do |s|
  s.name          = 'opensearch-ruby'
  s.version       = OpenSearch::VERSION
  s.authors       = ['Jayesh Hathila', 'Vamshi Vijay Nakkirtha', 'Vijayan Balasubramanian' , 'Yuvraj Jaiswal']
  s.email         = ['jayehh@amazon.com', 'vamshin@amazon.com', 'balasvij@amazon.com', 'jaiyuvra@amazon.com']
  s.summary       = 'Ruby integrations for OpenSearch'
  s.homepage      = 'https://opensearch.org/docs/latest'
  s.license       = 'Apache-2.0'
  s.metadata = {
    'homepage_uri' => 'https://opensearch.org/docs/latest/',
    'source_code_uri' => 'https://github.com/opensearch-project/opensearch-ruby/tree/main',
    'bug_tracker_uri' => 'https://github.com/opensearch-project/opensearch-ruby/issues'
  }
  s.files         = `git ls-files`.split($/)
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.executables   << 'opensearch_ruby_console'
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.cert_chain  = ['../certs/opensearch-rubygems.pem']
  s.require_paths = ['lib']
  s.bindir = 'bin'

  s.extra_rdoc_files  = [ 'README.md', 'LICENSE' ]
  s.rdoc_options      = [ '--charset=UTF-8' ]

  s.required_ruby_version = '>= 2.4'

  s.add_dependency 'opensearch-transport', '1.0.0'
  s.add_dependency 'opensearch-api',       '1.0.0'

  s.add_development_dependency 'bundler'
  s.add_development_dependency 'byebug' unless defined?(JRUBY_VERSION) || defined?(Rubinius)
  s.add_development_dependency 'pry'
  s.add_development_dependency 'rake', '~> 13'
  s.add_development_dependency 'require-prof' unless defined?(JRUBY_VERSION) || defined?(Rubinius)
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'ruby-prof' unless defined?(JRUBY_VERSION) || defined?(Rubinius)
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'webmock'
  s.add_development_dependency 'yard'

  s.description = <<-DESC.gsub(/^    /, '')
    Ruby integrations for OpenSearch (client, API, etc.)
  DESC
end
