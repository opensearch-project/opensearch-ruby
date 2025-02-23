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
    module List
      module Actions
        # Returns paginated details of shard allocation on nodes.
        #
        # @option args [String] :bytes The unit used to display byte values.
        # @option args [String] :cluster_manager_timeout Operation timeout for connection to cluster-manager node.
        # @option args [String] :format A short version of the Accept header, such as `JSON`, `YAML`.
        # @option args [Enumerable<String>] :h Comma-separated list of column names to display.
        # @option args [Boolean] :help Return help information.
        # @option args [Boolean] :local Return local information, do not retrieve the state from cluster-manager node.
        # @option args [String] :master_timeout DEPRECATED Operation timeout for connection to cluster-manager node.
        # @option args [Hash] :next_token Token to retrieve next page of shards.
        # @option args [Enumerable<String>] :s Comma-separated list of column names or column aliases to sort by.
        # @option args [Integer] :size Maximum number of shards to be displayed in a page.
        # @option args [String] :sort Defines order in which shards will be displayed. Accepted values are `asc` and `desc`. If `desc`, most recently created shards would be displayed first.
        # @option args [String] :time The unit in which to display time values.
        # @option args [Boolean] :v Verbose mode. Display column headers.
        # @option args [Enumerable<String>, String] :index A comma-separated list of data streams, indexes, and aliases used to limit the request. Supports wildcards (`*`). To target all data streams and indexes, omit this parameter or use `*` or `_all`.
        def shards(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          _index = args.delete('index')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'GET'
          url     = Utils.build_url('_list/shards', _index)

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
          next_token
          s
          size
          sort
          time
          v
        ]).freeze
      end
    end
  end
end
