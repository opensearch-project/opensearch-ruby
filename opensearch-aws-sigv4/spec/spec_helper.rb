# SPDX-License-Identifier: Apache-2.0
#
# The OpenSearch Contributors require contributions made to
# this file be licensed under the Apache-2.0 license or a
# compatible open source license.
#
# Modifications Copyright OpenSearch Contributors. See
# GitHub history for details.

require 'opensearch-aws-sigv4'
require 'rspec'

OPENSEARCH_URL = ENV.fetch('TEST_OPENSEARCH_SERVER', nil) || "http://localhost:#{ENV.fetch('PORT', nil) || 9200}"
raise URI::InvalidURIError unless OPENSEARCH_URL =~ /\A#{URI::DEFAULT_PARSER.make_regexp}\z/

RSpec.configure do |config|
  config.formatter = :documentation
end
