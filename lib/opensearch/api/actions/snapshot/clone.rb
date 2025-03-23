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
        # Creates a clone of all or part of a snapshot in the same repository as the original snapshot.
        #
        # @option args [String] :repository *Required* The name of repository which will contain the snapshots clone.
        # @option args [String] :snapshot *Required* The name of the original snapshot.
        # @option args [String] :target_snapshot *Required* The name of the cloned snapshot.
        # @option args [String] :cluster_manager_timeout The amount of time to wait for a response from the cluster manager node. For more information about supported time units, see [Common parameters](https://opensearch.org/docs/latest/api-reference/common-parameters/#time-units).
        # @option args [String] :master_timeout DEPRECATED Explicit operation timeout for connection to cluster-manager node
        # @option args [Hash] :body *Required* The snapshot clone definition.
        def clone(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'repository' missing" if args['repository'].nil?
          raise ArgumentError, "Required argument 'snapshot' missing" if args['snapshot'].nil?
          raise ArgumentError, "Required argument 'target_snapshot' missing" if args['target_snapshot'].nil?
          raise ArgumentError, "Required argument 'body' missing" if args['body'].nil?

          _repository = args.delete('repository')
          _snapshot = args.delete('snapshot')
          _target_snapshot = args.delete('target_snapshot')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'PUT'
          url     = Utils.build_url('_snapshot', _repository, _snapshot, '_clone', _target_snapshot)

          Utils.validate_query_params! args, CLONE_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        CLONE_QUERY_PARAMS = Set.new(%w[
          cluster_manager_timeout
          master_timeout
        ]).freeze
      end
    end
  end
end
