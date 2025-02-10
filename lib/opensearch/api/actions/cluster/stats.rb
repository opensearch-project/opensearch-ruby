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
    module Cluster
      module Actions
        # Returns a high-level overview of cluster statistics.
        #
        # @option args [Boolean] :flat_settings When `true`, returns settings in a flat format.
        # @option args [String] :timeout The amount of time to wait for each node to respond. If a node does not respond before its timeout expires, the response does not include its stats. However, timed out nodes are included in the response's `_nodes.failed` property. Defaults to no timeout.
        # @option args [Enumerable<String>] :index_metric A comma-separated list of index metric groups, for example, `docs,store`.
        # @option args [Enumerable<String>] :metric Limit the information returned to the specified metrics.
        # @option args [Enumerable<String>, String] :node_id A comma-separated list of node IDs used to filter results. Supports [node filters](https://opensearch.org/docs/latest/api-reference/nodes-apis/index/#node-filters).
        def stats(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          _index_metric = args.delete('index_metric')
          _metric = args.delete('metric')
          _node_id = args.delete('node_id')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'GET'
          url     = Utils.build_url('_cluster/stats', _metric, _index_metric, 'nodes', _node_id)

          Utils.validate_query_params! args, STATS_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        STATS_QUERY_PARAMS = Set.new(%w[
          flat_settings
          timeout
        ]).freeze
      end
    end
  end
end
