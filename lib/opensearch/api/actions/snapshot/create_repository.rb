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
        # Creates a snapshot repository.
        #
        # @option args [String] :repository *Required* The name for the newly registered repository.
        # @option args [String] :cluster_manager_timeout The amount of time to wait for a response from the cluster manager node. For more information about supported time units, see [Common parameters](https://opensearch.org/docs/latest/api-reference/common-parameters/#time-units).
        # @option args [String] :master_timeout DEPRECATED Explicit operation timeout for connection to cluster-manager node
        # @option args [String] :timeout The amount of time to wait for a response.
        # @option args [Boolean] :verify When `true`, verifies the creation of the snapshot repository.
        # @option args [Hash] :body *Required* The repository definition.
        def create_repository(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'repository' missing" if args['repository'].nil?
          raise ArgumentError, "Required argument 'body' missing" if args['body'].nil?

          _repository = args.delete('repository')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'POST'
          url     = Utils.build_url('_snapshot', _repository)

          Utils.validate_query_params! args, CREATE_REPOSITORY_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        CREATE_REPOSITORY_QUERY_PARAMS = Set.new(%w[
          cluster_manager_timeout
          master_timeout
          timeout
          verify
        ]).freeze
      end
    end
  end
end
