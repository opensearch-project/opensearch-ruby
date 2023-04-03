# SPDX-License-Identifier: Apache-2.0
#
# The OpenSearch Contributors require contributions made to
# this file be licensed under the Apache-2.0 license or a
# compatible open source license.
#
# Modifications Copyright OpenSearch Contributors. See
# GitHub history for details.

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'opensearch-aws-sigv4/version'

signing_key_path = File.expand_path('../gem-private_key.pem')

Gem::Specification.new do |s|
  s.name          = 'opensearch-aws-sigv4'
  s.version       = OpenSearch::Aws::Sigv4::VERSION
  s.authors       = ['Theo Truong', 'Robin Roestenburg']
  s.email         = ['theo.nam.truong@gmail.com', 'robin.roestenburg@4me.com']
  s.summary       = 'Ruby AWS Sigv4 Client for OpenSearch'
  s.homepage      = 'https://opensearch.org/docs/latest'
  s.license       = 'Apache-2.0'
  s.metadata = {
    'homepage_uri' => 'https://opensearch.org/docs/latest/',
    'source_code_uri' => 'https://github.com/opensearch-project/opensearch-ruby/tree/main',
    'bug_tracker_uri' => 'https://github.com/opensearch-project/opensearch-ruby/issues',
    'rubygems_mfa_required' => 'true'
  }
  s.files         = `git ls-files`.split($/)
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.executables << 'opensearch_sigv4_console'
  s.test_files = s.files.grep(%r{^(test|spec|features)/})

  if $PROGRAM_NAME.end_with?('gem') && ARGV == ['build', __FILE__] && File.exist?(signing_key_path)
    s.signing_key = signing_key_path
    s.cert_chain  = ['../certs/opensearch-rubygems.pem']
  end

  s.require_paths = ['lib']
  s.bindir = 'bin'

  s.extra_rdoc_files  = ['README.md', 'LICENSE']
  s.rdoc_options      = ['--charset=UTF-8']

  s.required_ruby_version = '>= 2.5'

  s.add_dependency 'aws-sigv4', '~> 1'
  s.add_dependency 'opensearch-ruby', '>= 1.0.1'

  s.add_development_dependency 'bundler'
  s.add_development_dependency 'byebug' unless defined?(JRUBY_VERSION) || defined?(Rubinius)
  s.add_development_dependency 'pry'
  s.add_development_dependency 'rake', '~> 13'
  s.add_development_dependency 'require-prof' unless defined?(JRUBY_VERSION) || defined?(Rubinius)
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'ruby-prof' unless defined?(JRUBY_VERSION) || defined?(Rubinius)
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'timecop'
  s.add_development_dependency 'yard'

  s.description = <<-DESC.gsub(/^    /, '')
    Ruby AWS Sigv4 Client for OpenSearch
  DESC
end
