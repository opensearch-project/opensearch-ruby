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
        # Lists the states of all primary and replica shards and how they are distributed.
        #
        # @option args [String] :bytes The units used to display byte values.
        # @option args [String] :cluster_manager_timeout The amount of time allowed to establish a connection to the cluster manager node.
        # @option args [String] :format A short version of the `Accept` header, such as `json` or `yaml`.
        # @option args [Enumerable<String>] :h A comma-separated list of column names to display.
        # @option args [Boolean] :help Returns help information.
        # @option args [Boolean] :local Returns local information but does not retrieve the state from the cluster manager node.
        # @option args [String] :master_timeout DEPRECATED The amount of time allowed to establish a connection to the cluster manager node.
        # @option args [Enumerable<String>] :s A comma-separated list of column names or column aliases to sort by.
        # @option args [String] :time Specifies the time units, for example, `5d` or `7h`. For more information, see [Supported units](https://opensearch.org/docs/latest/api-reference/units/).
        # @option args [Boolean] :v Enables verbose mode, which displays column headers.
        # @option args [Enumerable<String>, String] :index A comma-separated list of data streams, indexes, and aliases used to limit the request. Supports wildcards (`*`). To target all data streams and indexes, omit this parameter or use `*` or `_all`.
        def shards(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          _index = args.delete('index')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'GET'
          url     = Utils.build_url('_cat/shards', _index)

          Utils.validate_query_params! args, SHARDS_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        SHARDS_QUERY_PARAMS = Set.new(%w[
          bytes
          cluster_manager_timeout
          format
          h
          help
          local
          master_timeout
          s
          time
          v
        ]).freeze
      end
    end
  end
end
