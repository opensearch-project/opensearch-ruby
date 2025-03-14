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
        # @option args [String] :cluster_manager_timeout The amount of time to wait for a response from the cluster manager node. For more information about supported time units, see [Common parameters](https://opensearch.org/docs/latest/api-reference/common-parameters/#time-units).
        # @option args [Boolean] :dry_run When `true`, the request simulates the operation and returns the resulting state.
        # @option args [Boolean] :explain When `true`, the response contains an explanation of why reroute certain commands can or cannot be executed.
        # @option args [String] :master_timeout DEPRECATED A duration. Units can be `nanos`, `micros`, `ms` (milliseconds), `s` (seconds), `m` (minutes), `h` (hours) and `d` (days). Also accepts "0" without a unit and "-1" to indicate an unspecified value.
        # @option args [Enumerable<String>, String] :metric Limits the information returned to the specified metrics.
        # @option args [Boolean] :retry_failed When `true`, retries shard allocation if it was blocked because of too many subsequent failures.
        # @option args [String] :timeout A duration. Units can be `nanos`, `micros`, `ms` (milliseconds), `s` (seconds), `m` (minutes), `h` (hours) and `d` (days). Also accepts "0" without a unit and "-1" to indicate an unspecified value.
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
