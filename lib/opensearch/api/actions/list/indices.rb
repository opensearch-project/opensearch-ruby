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
        # Returns paginated information about indexes including number of primaries and replicas, document counts, disk size.
        #
        # @option args [String] :bytes The unit used to display byte values.
        # @option args [String] :cluster_manager_timeout Operation timeout for connection to cluster-manager node.
        # @option args [Enumerable<String>, String] :expand_wildcards The type of index that wildcard patterns can match.
        # @option args [String] :format A short version of the Accept header, such as `JSON`, `YAML`.
        # @option args [Enumerable<String>] :h A comma-separated list of column names to display.
        # @option args [String] :health The health status used to limit returned indexes. By default, the response includes indexes of any health status.
        # @option args [Boolean] :help Return help information.
        # @option args [Boolean] :include_unloaded_segments If `true`, the response includes information from segments that are not loaded into memory.
        # @option args [Boolean] :local Return local information, do not retrieve the state from cluster-manager node.
        # @option args [String] :master_timeout DEPRECATED Operation timeout for connection to cluster-manager node.
        # @option args [Hash] :next_token Token to retrieve next page of indexes.
        # @option args [Boolean] :pri If `true`, the response only includes information from primary shards.
        # @option args [Enumerable<String>] :s A comma-separated list of column names or column aliases to sort by.
        # @option args [Integer] :size Maximum number of indexes to be displayed in a page.
        # @option args [String] :sort Defines order in which indexes will be displayed. Accepted values are `asc` and `desc`. If `desc`, most recently created indexes would be displayed first.
        # @option args [String] :time The unit used to display time values.
        # @option args [Boolean] :v Verbose mode. Display column headers.
        # @option args [Enumerable<String>, String] :index A comma-separated list of data streams, indexes, and aliases used to limit the request. Supports wildcards (`*`). To target all data streams and indexes, omit this parameter or use `*` or `_all`.
        def indices(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          _index = args.delete('index')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'GET'
          url     = Utils.build_url('_list/indices', _index)

          Utils.validate_query_params! args, INDICES_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        INDICES_QUERY_PARAMS = Set.new(%w[
          bytes
          cluster_manager_timeout
          expand_wildcards
          format
          h
          health
          help
          include_unloaded_segments
          local
          master_timeout
          next_token
          pri
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
