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
        # Creates a snapshot within an existing repository.
        #
        # @option args [String] :repository *Required* The name of the repository where the snapshot will be stored.
        # @option args [String] :snapshot *Required* The name of the snapshot. Must be unique in the repository.
        # @option args [String] :cluster_manager_timeout The amount of time to wait for a response from the cluster manager node. For more information about supported time units, see [Common parameters](https://opensearch.org/docs/latest/api-reference/common-parameters/#time-units).
        # @option args [String] :master_timeout DEPRECATED Period to wait for a connection to the cluster-manager node. If no response is received before the timeout expires, the request fails and returns an error.
        # @option args [Boolean] :wait_for_completion When `true`, the request returns a response when the snapshot is complete. When `false`, the request returns a response when the snapshot initializes.
        # @option args [Hash] :body The snapshot definition.
        def create(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'repository' missing" if args['repository'].nil?
          raise ArgumentError, "Required argument 'snapshot' missing" if args['snapshot'].nil?

          _repository = args.delete('repository')
          _snapshot = args.delete('snapshot')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'POST'
          url     = Utils.build_url('_snapshot', _repository, _snapshot)

          Utils.validate_query_params! args, CREATE_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        CREATE_QUERY_PARAMS = Set.new(%w[
          cluster_manager_timeout
          master_timeout
          wait_for_completion
        ]).freeze
      end
    end
  end
end
