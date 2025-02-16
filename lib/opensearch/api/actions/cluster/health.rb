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
        # @option args [String] :awareness_attribute The name of the awareness attribute for which to return the cluster health status (for example, `zone`). Applicable only if `level` is set to `awareness_attributes`.
        # @option args [String] :cluster_manager_timeout A duration. Units can be `nanos`, `micros`, `ms` (milliseconds), `s` (seconds), `m` (minutes), `h` (hours) and `d` (days). Also accepts "0" without a unit and "-1" to indicate an unspecified value.
        # @option args [Enumerable<String>, String] :expand_wildcards Specifies the type of index that wildcard expressions can match. Supports comma-separated values.
        # @option args [String] :level (default: cluster) Controls the amount of detail included in the cluster health response.
        # @option args [Boolean] :local Whether to return information from the local node only instead of from the cluster manager node.
        # @option args [String] :master_timeout DEPRECATED A duration. Units can be `nanos`, `micros`, `ms` (milliseconds), `s` (seconds), `m` (minutes), `h` (hours) and `d` (days). Also accepts "0" without a unit and "-1" to indicate an unspecified value.
        # @option args [String] :timeout A duration. Units can be `nanos`, `micros`, `ms` (milliseconds), `s` (seconds), `m` (minutes), `h` (hours) and `d` (days). Also accepts "0" without a unit and "-1" to indicate an unspecified value.
        # @option args [Integer, String] :wait_for_active_shards Waits until the specified number of shards is active before returning a response. Use `all` for all shards.
        # @option args [String] :wait_for_events Waits until all currently queued events with the given priority are processed.
        # @option args [Boolean] :wait_for_no_initializing_shards Whether to wait until there are no initializing shards in the cluster.
        # @option args [Boolean] :wait_for_no_relocating_shards Whether to wait until there are no relocating shards in the cluster.
        # @option args [Float, String] :wait_for_nodes Waits until the specified number of nodes (`N`) is available. Accepts `>=N`, `<=N`, `>N`, and `<N`. You can also use `ge(N)`, `le(N)`, `gt(N)`, and `lt(N)` notation.
        # @option args [String] :wait_for_status Waits until the cluster health reaches the specified status or better.
        # @option args [Enumerable<String>, String] :index A comma-separated list of data streams, indexes, and aliases used to limit the request. Supports wildcards (`*`). To target all data streams and indexes, omit this parameter or use `*` or `_all`.
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
