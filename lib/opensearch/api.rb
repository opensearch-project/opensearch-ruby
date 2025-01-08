# SPDX-License-Identifier: Apache-2.0
#
# The OpenSearch Contributors require contributions made to
# this file be licensed under the Apache-2.0 license or a
# compatible open source license.

# This file is generated from the OpenSearch REST API spec.
# Do not modify it by hand. Instead, modify the generator or the spec.

# frozen_string_literal: true

module OpenSearch
  module API
    GLOBAL_QUERY_PARAMS = Set.new([
      'pretty',         # Whether to pretty format the returned JSON response.
      'human',          # Whether to return human readable values for statistics.
      'error_trace',    # Whether to include the stack trace of returned errors.
      'source',         # The URL-encoded request definition. Useful for libraries that do not accept a request body for non-POST requests.
      'filter_path'     # Used to reduce the response. This parameter takes a comma-separated list of filters. It supports using wildcards to match any field or part of a field’s name. You can also exclude fields with "-".
    ]).freeze

    DEFAULT_SERIALIZER = MultiJson

    def self.serializer
      settings[:serializer] || DEFAULT_SERIALIZER
    end

    def self.settings
      @settings ||= {}
    end
  end
end
