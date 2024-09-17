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
    module Cat
      module Actions
        # Lists all active point-in-time segments.
        #
        # @option args [String] :bytes The unit in which to display byte values.
        # @option args [String] :format A short version of the Accept header (for example, `json`, `yaml`).
        # @option args [Enumerable<String>] :h Comma-separated list of column names to display.
        # @option args [Boolean] :help Return help information.
        # @option args [Enumerable<String>] :s Comma-separated list of column names or column aliases to sort by.
        # @option args [Boolean] :v Verbose mode. Display column headers.
        def all_pit_segments(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'GET'
          url     = '_cat/pit_segments/_all'

          Utils.validate_query_params! args, ALL_PIT_SEGMENTS_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        ALL_PIT_SEGMENTS_QUERY_PARAMS = Set.new(%w[
          bytes
          format
          h
          help
          s
          v
        ]).freeze
      end
    end
  end
end
