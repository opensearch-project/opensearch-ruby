# SPDX-License-Identifier: Apache-2.0
#
# The OpenSearch Contributors require contributions made to
# this file be licensed under the Apache-2.0 license or a
# compatible open source license.
#
# Modifications Copyright OpenSearch Contributors. See
# GitHub history for details.

source 'https://rubygems.org'

# Specify your gem's dependencies in opensearch-aws-sigv4.gemspec
gemspec

if File.exist? File.expand_path('../opensearch-api/opensearch-api.gemspec', __dir__)
  gem 'opensearch-api', path: File.expand_path('../opensearch-api', __dir__), require: false
end

if File.exist? File.expand_path('../opensearch-transport/opensearch-transport.gemspec', __dir__)
  gem 'opensearch-transport', path: File.expand_path('../opensearch-transport', __dir__), require: false
end

if File.exist? File.expand_path('../opensearch-ruby/opensearch-ruby.gemspec', __dir__)
  gem 'opensearch-ruby', path: File.expand_path('../opensearch-ruby', __dir__), require: false
end
