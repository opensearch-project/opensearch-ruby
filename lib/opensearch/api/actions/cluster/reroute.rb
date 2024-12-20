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
        # Allows to manually change the allocation of individual shards in the cluster.
        #
        # @option args [String] :cluster_manager_timeout Operation timeout for connection to cluster-manager node.
        # @option args [Boolean] :dry_run If `true`, then the request simulates the operation only and returns the resulting state.
        # @option args [Boolean] :explain If `true`, then the response contains an explanation of why the commands can or cannot be executed.
        # @option args [String] :master_timeout DEPRECATED Period to wait for a connection to the cluster-manager node. If no response is received before the timeout expires, the request fails and returns an error.
        # @option args [Enumerable<String>, String] :metric Limits the information returned to the specified metrics.
        # @option args [Boolean] :retry_failed If `true`, then retries allocation of shards that are blocked due to too many subsequent allocation failures.
        # @option args [String] :timeout Period to wait for a response. If no response is received before the timeout expires, the request fails and returns an error.
        # @option args [Hash] :body The definition of `commands` to perform (`move`, `cancel`, `allocate`)
        def reroute(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'POST'
          url     = '_cluster/reroute'

          Utils.validate_query_params! args, REROUTE_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        REROUTE_QUERY_PARAMS = Set.new(%w[
          cluster_manager_timeout
          dry_run
          explain
          master_timeout
          metric
          retry_failed
          timeout
        ]).freeze
      end
    end
  end
end
