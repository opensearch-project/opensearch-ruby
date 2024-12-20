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
        # Returns information about index shard recoveries, both on-going completed.
        #
        # @option args [Boolean] :active_only If `true`, the response only includes ongoing shard recoveries.
        # @option args [String] :bytes The unit used to display byte values.
        # @option args [Boolean] :detailed If `true`, the response includes detailed information about shard recoveries.
        # @option args [String] :format A short version of the Accept header (for example, `json`, `yaml`).
        # @option args [Enumerable<String>] :h Comma-separated list of column names to display.
        # @option args [Boolean] :help Return help information.
        # @option args [Enumerable<String>] :index Comma-separated list or wildcard expression of index names to limit the returned information.
        # @option args [Enumerable<String>] :s Comma-separated list of column names or column aliases to sort by.
        # @option args [String] :time The unit in which to display time values.
        # @option args [Boolean] :v Verbose mode. Display column headers.
        def recovery(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          _index = args.delete('index')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'GET'
          url     = Utils.build_url('_cat/recovery', _index)

          Utils.validate_query_params! args, RECOVERY_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        RECOVERY_QUERY_PARAMS = Set.new(%w[
          active_only
          bytes
          detailed
          format
          h
          help
          s
          time
          v
        ]).freeze
      end
    end
  end
end
