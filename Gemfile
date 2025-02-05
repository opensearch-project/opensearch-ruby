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

source 'https://rubygems.org'

gem 'opensearch-ruby', path: __dir__, require: false

# TODO: remove unnecessary dependencies
gem 'ansi'
gem 'bundler'
gem 'cane'
gem 'hashie'
gem 'jbuilder'
gem 'jsonify'
gem 'minitest', '~> 5'
gem 'minitest-reporters', '~> 1'
gem 'mocha', '~> 2'
gem 'pry'
gem 'rake', '~> 13'
gem 'rspec', '~> 3'
gem 'rubocop', '~> 1.28.0'
gem 'rubocop-rake'
gem 'rubocop-rspec'
gem 'shoulda-context'
gem 'simplecov', '~> 0.17', '< 0.18'
gem 'test-unit', '~> 2'
gem 'webmock', '~> 2.0'
gem 'yard'

if defined? JRUBY_VERSION
  gem 'manticore'
  gem 'pry-nav'
else
  gem 'curb'
  gem 'require-prof'
  gem 'ruby-prof'
end

if ENV.key?('FARADAY_VERSION')
  gem 'faraday', ENV.fetch('FARADAY_VERSION'), require: false
  gem 'httpclient'
  gem 'net-http-persistent'
  gem 'patron' unless defined? JRUBY_VERSION
  gem 'typhoeus', '~> 1.4'
else
  gem 'faraday-httpclient'
  gem 'faraday-net_http_persistent'
  gem 'faraday-patron' unless defined? JRUBY_VERSION
  gem 'faraday-typhoeus'
end
