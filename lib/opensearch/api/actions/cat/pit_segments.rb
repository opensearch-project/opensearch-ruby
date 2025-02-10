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
        # Lists one or several CAT point-in-time segments.
        #
        # @option args [String] :bytes The units used to display byte values.
        # @option args [String] :format A short version of the `Accept` header, such as `json` or `yaml`.
        # @option args [Enumerable<String>] :h A comma-separated list of column names to display.
        # @option args [Boolean] :help Returns help information.
        # @option args [Enumerable<String>] :s A comma-separated list of column names or column aliases to sort by.
        # @option args [Boolean] :v Enables verbose mode, which displays column headers.
        # @option args [Hash] :body
        def pit_segments(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'GET'
          url     = '_cat/pit_segments'

          Utils.validate_query_params! args, PIT_SEGMENTS_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        PIT_SEGMENTS_QUERY_PARAMS = Set.new(%w[
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
