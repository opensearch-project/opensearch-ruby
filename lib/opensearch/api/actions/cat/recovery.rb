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
        # Returns all completed and ongoing index and shard recoveries.
        #
        # @option args [Boolean] :active_only If `true`, the response only includes ongoing shard recoveries.
        # @option args [String] :bytes The units used to display byte values.
        # @option args [Boolean] :detailed When `true`, includes detailed information about shard recoveries.
        # @option args [String] :format A short version of the `Accept` header, such as `json` or `yaml`.
        # @option args [Enumerable<String>] :h A comma-separated list of column names to display.
        # @option args [Boolean] :help Returns help information.
        # @option args [Enumerable<String>] :index A comma-separated list of data streams, indexes, and aliases used to limit the request. Supports wildcards (`*`). To target all data streams and indexes, omit this parameter or use `*` or `_all`.
        # @option args [Enumerable<String>] :s A comma-separated list of column names or column aliases to sort by.
        # @option args [String] :time Specifies the time units, for example, `5d` or `7h`. For more information, see [Supported units](https://opensearch.org/docs/latest/api-reference/units/).
        # @option args [Boolean] :v Enables verbose mode, which displays column headers.
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
