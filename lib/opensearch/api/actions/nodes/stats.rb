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
    module Nodes
      module Actions
        # Returns statistical information about nodes in the cluster.
        #
        # @option args [Enumerable<String>, String] :node_id Comma-separated list of node IDs or names used to limit returned information.
        # @option args [Enumerable<String>, String] :completion_fields Comma-separated list or wildcard expressions of fields to include in field data and suggest statistics.
        # @option args [Enumerable<String>, String] :fielddata_fields Comma-separated list or wildcard expressions of fields to include in field data statistics.
        # @option args [Enumerable<String>, String] :fields Comma-separated list or wildcard expressions of fields to include in the statistics.
        # @option args [Enumerable<String>] :groups Comma-separated list of search groups to include in the search statistics.
        # @option args [Boolean] :include_segment_file_sizes If `true`, the call reports the aggregated disk usage of each one of the Lucene index files (only applies if segment stats are requested).
        # @option args [String] :level Indicates whether statistics are aggregated at the cluster, index, or shard level.
        # @option args [String] :timeout Period to wait for a response. If no response is received before the timeout expires, the request fails and returns an error.
        # @option args [Enumerable<String>] :types A comma-separated list of document types for the indexing index metric.
        # @option args [Enumerable<String>] :metric Limit the information returned to the specified metrics
        # @option args [Enumerable<String>] :index_metric Limit the information returned for indexes metric to the specific index metrics. It can be used only if indexes (or all) metric is specified.
        def stats(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          _node_id = args.delete('node_id')
          _metric = args.delete('metric')
          _index_metric = args.delete('index_metric')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'GET'
          url     = Utils.build_url('_nodes', _node_id, 'stats', _metric, _index_metric)

          Utils.validate_query_params! args, STATS_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        STATS_QUERY_PARAMS = Set.new(%w[
          completion_fields
          fielddata_fields
          fields
          groups
          include_segment_file_sizes
          level
          timeout
          types
        ]).freeze
      end
    end
  end
end
