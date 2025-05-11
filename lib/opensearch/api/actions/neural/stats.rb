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
    module Neural
      module Actions
        # Provides information about the current status of the neural-search plugin.
        #
        # @option args [String] :node_id Comma-separated list of node IDs or names to limit the returned information; leave empty to get information from all nodes.
        # @option args [Boolean] :flat_stat_paths Whether to return stats in the flat form, which can improve readability, especially for heavily nested stats. For example, the flat form of `"processors": { "ingest": { "text_embedding_executions": 20181212 } }` is  `"processors.ingest.text_embedding_executions": "20181212"`.
        # @option args [Boolean] :include_metadata Whether to return stat metadata instead of the raw stat value, includes additional information about the stat. These can include things like type hints, time since last stats being recorded, or recent rolling interval values
        # @option args [String] :stat Comma-separated list of stats to retrieve; use empty string to retrieve all stats.
        def stats(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          _node_id = args.delete('node_id')
          _stat = args.delete('stat')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'GET'
          url     = Utils.build_url('_plugins/_neural', _node_id, 'stats', _stat)

          Utils.validate_query_params! args, STATS_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        STATS_QUERY_PARAMS = Set.new(%w[
          flat_stat_paths
          include_metadata
        ]).freeze
      end
    end
  end
end
