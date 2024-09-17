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
        # Returns basic information about the health of the cluster.
        #
        # @option args [String] :awareness_attribute The awareness attribute for which the health is required.
        # @option args [String] :cluster_manager_timeout Operation timeout for connection to cluster-manager node.
        # @option args [Enumerable<String>, String] :expand_wildcards Whether to expand wildcard expression to concrete indexes that are open, closed or both.
        # @option args [String] :level Can be one of cluster, indexes or shards. Controls the details level of the health information returned.
        # @option args [Boolean] :local If `true`, the request retrieves information from the local node only. Defaults to false, which means information is retrieved from the cluster-manager node.
        # @option args [String] :master_timeout DEPRECATED Period to wait for a connection to the cluster-manager node. If no response is received before the timeout expires, the request fails and returns an error.
        # @option args [String] :timeout Period to wait for a response. If no response is received before the timeout expires, the request fails and returns an error.
        # @option args [Integer, String] :wait_for_active_shards A number controlling to how many active shards to wait for, all to wait for all shards in the cluster to be active, or 0 to not wait.
        # @option args [String] :wait_for_events Can be one of immediate, urgent, high, normal, low, languid. Wait until all currently queued events with the given priority are processed.
        # @option args [Boolean] :wait_for_no_initializing_shards A Boolean value which controls whether to wait (until the timeout provided) for the cluster to have no shard initializations. Defaults to false, which means it will not wait for initializing shards.
        # @option args [Boolean] :wait_for_no_relocating_shards A Boolean value which controls whether to wait (until the timeout provided) for the cluster to have no shard relocations. Defaults to false, which means it will not wait for relocating shards.
        # @option args [Float, String] :wait_for_nodes The request waits until the specified number N of nodes is available. It also accepts >=N, <=N, >N and <N. Alternatively, it is possible to use ge(N), le(N), gt(N) and lt(N) notation.
        # @option args [String] :wait_for_status One of green, yellow or red. Will wait (until the timeout provided) until the status of the cluster changes to the one provided or better, i.e. green > yellow > red. By default, will not wait for any status.
        # @option args [Enumerable<String>, String] :index Comma-separated list of data streams, indexes, and index aliases used to limit the request. Wildcard expressions (*) are supported. To target all data streams and indexes in a cluster, omit this parameter or use `_all` or `*`.
        def health(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          _index = args.delete('index')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'GET'
          url     = Utils.build_url('_cluster/health', _index)

          Utils.validate_query_params! args, HEALTH_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        HEALTH_QUERY_PARAMS = Set.new(%w[
          awareness_attribute
          cluster_manager_timeout
          expand_wildcards
          level
          local
          master_timeout
          timeout
          wait_for_active_shards
          wait_for_events
          wait_for_no_initializing_shards
          wait_for_no_relocating_shards
          wait_for_nodes
          wait_for_status
        ]).freeze
      end
    end
  end
end
