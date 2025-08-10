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
    module SearchRelevance
      module Actions
        # Gets stats by node.
        #
        # @option args [String] :node_id *Required* The node id
        # @option args [String] :flat_stat_paths Requests flattened stat paths as keys
        # @option args [String] :include_all_nodes Whether to include all nodes
        # @option args [String] :include_individual_nodes Whether to include individual nodes
        # @option args [String] :include_info Whether to include info
        # @option args [String] :include_metadata Whether to include metadata
        # @option args [String] :stat The statistic to return
        def get_node_stats(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'node_id' missing" if args['node_id'].nil?

          _node_id = args.delete('node_id')
          _stat = args.delete('stat')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'GET'
          url     = Utils.build_url('_plugins/_search_relevance', _node_id, 'stats', _stat)

          Utils.validate_query_params! args, GET_NODE_STATS_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        GET_NODE_STATS_QUERY_PARAMS = Set.new(%w[
          flat_stat_paths
          include_all_nodes
          include_individual_nodes
          include_info
          include_metadata
        ]).freeze
      end
    end
  end
end
