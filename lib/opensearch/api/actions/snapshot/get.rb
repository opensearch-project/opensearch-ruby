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
    module Snapshot
      module Actions
        # Returns information about a snapshot.
        #
        # @option args [String] :repository *Required* Comma-separated list of snapshot repository names used to limit the request. Wildcard (*) expressions are supported.
        # @option args [Enumerable<String>, String] :snapshot *Required* Comma-separated list of snapshot names to retrieve. Also accepts wildcards (`*`). - To get information about all snapshots in a registered repository, use a wildcard (`*`) or `_all`. - To get information about any snapshots that are currently running, use `_current`.
        # @option args [String] :cluster_manager_timeout Operation timeout for connection to cluster-manager node.
        # @option args [Boolean] :ignore_unavailable If `false`, the request returns an error for any snapshots that are unavailable.
        # @option args [String] :master_timeout DEPRECATED Period to wait for a connection to the cluster-manager node. If no response is received before the timeout expires, the request fails and returns an error.
        # @option args [Boolean] :verbose If `true`, returns additional information about each snapshot such as the version of OpenSearch which took the snapshot, the start and end times of the snapshot, and the number of shards snapshotted.
        def get(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'repository' missing" if args['repository'].nil?
          raise ArgumentError, "Required argument 'snapshot' missing" if args['snapshot'].nil?

          _repository = args.delete('repository')
          _snapshot = args.delete('snapshot')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'GET'
          url     = Utils.build_url('_snapshot', _repository, _snapshot)

          Utils.validate_query_params! args, GET_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        GET_QUERY_PARAMS = Set.new(%w[
          cluster_manager_timeout
          ignore_unavailable
          master_timeout
          verbose
        ]).freeze
      end
    end
  end
end
