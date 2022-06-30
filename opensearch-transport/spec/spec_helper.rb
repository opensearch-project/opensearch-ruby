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
if ENV['COVERAGE'] && ENV['CI'].nil?
  require 'simplecov'
  SimpleCov.start { add_filter %r{^/test|spec/} }
end

require 'opensearch-transport'
require 'faraday/httpclient'
require 'faraday/net_http_persistent'
require 'logger'
require 'ansi/code'
require 'hashie/mash'
if defined?(JRUBY_VERSION)
  require 'opensearch/transport/transport/http/manticore'
  require 'pry-nav'
else
  require 'pry-byebug'
  require 'faraday/patron'
  require 'faraday/typhoeus' if Gem::Version.new(Faraday::VERSION) >= Gem::Version.new('2')
  require 'opensearch/transport/transport/http/curb'
  require 'curb'
end

# The hosts to use for creating a opensearch client.
#
# @since 7.0.0
OPENSEARCH_HOSTS = if (hosts = ENV['TEST_OPENSEARCH_SERVER'] || ENV['OPENSEARCH_HOSTS'])
                        hosts.split(',').map do |host|
                          /(http\:\/\/)?(\S+)/.match(host)[2]
                        end
                      else
                        ['localhost:9200']
                      end.freeze

TEST_HOST, TEST_PORT = OPENSEARCH_HOSTS.first.split(':') if OPENSEARCH_HOSTS

# Are we testing on JRuby?
#
# @return [ true, false ] Whether JRuby is being used.
#
# @since 7.0.0
def jruby?
  RUBY_PLATFORM =~ /\bjava\b/
end

# The names of the connected nodes.
#
# @return [ Array<String> ] The node names.
#
# @since 7.0.0
def node_names
  node_stats = default_client.perform_request('GET', '_nodes/stats').body
  $node_names ||= node_stats['nodes'].collect do |name, stats|
    stats['name']
  end
end

# The default client.
#
# @return [ OpenSearch::Client ] The default client.
#
def default_client
  $client ||= OpenSearch::Client.new(hosts: OPENSEARCH_HOSTS)
end

module Config
  def self.included(context)
    # Get the hosts to use to connect an opensearch client.
    #
    # @since 7.0.0
    context.let(:hosts) { OPENSEARCH_HOSTS }
  end
end

RSpec.configure do |config|
  config.include(Config)
  config.formatter = 'documentation'
  config.color = true
end
