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
        # Returns a concise representation of the cluster health.
        #
        # @option args [String] :format A short version of the Accept header (for example, `json`, `yaml`).
        # @option args [Enumerable<String>] :h Comma-separated list of column names to display.
        # @option args [Boolean] :help Return help information.
        # @option args [Enumerable<String>] :s Comma-separated list of column names or column aliases to sort by.
        # @option args [String] :time The unit used to display time values.
        # @option args [Boolean] :ts (default: true) If `true`, returns `HH:MM:SS` and Unix epoch timestamps.
        # @option args [Boolean] :v Verbose mode. Display column headers.
        def health(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'GET'
          url     = '_cat/health'

          Utils.validate_query_params! args, HEALTH_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        HEALTH_QUERY_PARAMS = Set.new(%w[
          format
          h
          help
          s
          time
          ts
          v
        ]).freeze
      end
    end
  end
end
