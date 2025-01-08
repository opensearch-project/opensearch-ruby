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
    module Indices
      module Actions
        # Updates an alias to point to a new index when the existing index
        # is considered to be too large or too old.
        #
        # @option args [String] :alias *Required* Name of the data stream or index alias to roll over.
        # @option args [String] :cluster_manager_timeout Operation timeout for connection to cluster-manager node.
        # @option args [Boolean] :dry_run If `true`, checks whether the current index satisfies the specified conditions but does not perform a rollover.
        # @option args [String] :master_timeout DEPRECATED Period to wait for a connection to the cluster-manager node. If no response is received before the timeout expires, the request fails and returns an error.
        # @option args [String] :timeout Period to wait for a response. If no response is received before the timeout expires, the request fails and returns an error.
        # @option args [Integer, String] :wait_for_active_shards The number of shard copies that must be active before proceeding with the operation. Set to all or any positive integer up to the total number of shards in the index (`number_of_replicas+1`).
        # @option args [String] :new_index Name of the index to create. Supports date math. Data streams do not support this parameter.
        # @option args [Hash] :body The conditions that needs to be met for executing rollover
        def rollover(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'alias' missing" if args['alias'].nil?

          _alias = args.delete('alias')
          _new_index = args.delete('new_index')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'POST'
          url     = Utils.build_url(_alias, '_rollover', _new_index)

          Utils.validate_query_params! args, ROLLOVER_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        ROLLOVER_QUERY_PARAMS = Set.new(%w[
          cluster_manager_timeout
          dry_run
          master_timeout
          timeout
          wait_for_active_shards
        ]).freeze
      end
    end
  end
end
