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

# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'opensearch/transport/version'

signing_key_path = File.expand_path("../gem-private_key.pem")

Gem::Specification.new do |s|
  s.name          = 'opensearch-transport'
  s.version       = OpenSearch::Transport::VERSION
  s.authors       = ['Jayesh Hathila', 'Vamshi Vijay Nakkirtha', 'Vijayan Balasubramanian' , 'Yuvraj Jaiswal']
  s.email         = ['jayehh@amazon.com', 'vamshin@amazon.com', 'balasvij@amazon.com', 'jaiyuvra@amazon.com']
  s.summary       = 'Ruby client for OpenSearch.'
  s.homepage      = 'https://opensearch.org/docs/latest/'
  s.license       = 'Apache-2.0'
  s.metadata = {
    'homepage_uri' => 'https://opensearch.org/docs/latest/',
    'source_code_uri' => 'https://github.com/opensearch-project/opensearch-ruby/tree/main/opensearch-transport',
    'bug_tracker_uri' => 'https://github.com/opensearch-project/opensearch-ruby/issues'
  }
  s.files         = `git ls-files`.split($/)
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})

  if $PROGRAM_NAME.end_with?("gem") && ARGV == ["build", __FILE__] && File.exist?(signing_key_path)
    s.signing_key = signing_key_path
    s.cert_chain  = ['../certs/opensearch-rubygems.pem']
  end

  s.require_paths = ['lib']

  s.extra_rdoc_files  = [ 'README.md', 'LICENSE' ]
  s.rdoc_options      = [ '--charset=UTF-8' ]

  s.required_ruby_version = '>= 2.4'

  s.add_dependency 'multi_json'
  s.add_dependency 'faraday', '>= 1.0', '< 3'

  s.add_development_dependency 'ansi'
  s.add_development_dependency 'bundler'
  s.add_development_dependency 'cane'
  s.add_development_dependency 'curb' unless defined? JRUBY_VERSION
  s.add_development_dependency 'opensearch-ruby'
  s.add_development_dependency 'hashie'
  s.add_development_dependency 'httpclient'
  s.add_development_dependency 'faraday-httpclient'
  s.add_development_dependency 'manticore' if defined? JRUBY_VERSION
  s.add_development_dependency 'minitest'
  s.add_development_dependency 'minitest-reporters'
  s.add_development_dependency 'mocha'
  s.add_development_dependency 'net-http-persistent'
  s.add_development_dependency 'faraday-net_http_persistent'
  s.add_development_dependency 'patron' unless defined? JRUBY_VERSION
  s.add_development_dependency 'faraday-patron' unless defined? JRUBY_VERSION
  s.add_development_dependency 'pry'
  s.add_development_dependency 'rake', '~> 13'
  s.add_development_dependency 'require-prof' unless defined?(JRUBY_VERSION) || defined?(Rubinius)
  s.add_development_dependency 'ruby-prof'    unless defined?(JRUBY_VERSION) || defined?(Rubinius)
  s.add_development_dependency 'shoulda-context'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'test-unit', '~> 2'
  s.add_development_dependency 'typhoeus', '~> 1.4'
  s.add_development_dependency 'faraday-typhoeus' if !ENV.key?('FARADAY_VERSION') && Gem::Version.new(RUBY_VERSION) >= Gem::Version.new('2.6')
  s.add_development_dependency 'yard'

  s.description = <<-DESC.gsub(/^    /, '')
    Ruby client for OpenSearch. See the `opensearch` gem for full integration.
  DESC
end
