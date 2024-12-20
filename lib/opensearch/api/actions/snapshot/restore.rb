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
        # Restores a snapshot.
        #
        # @option args [String] :repository *Required* A repository name
        # @option args [String] :snapshot *Required* A snapshot name
        # @option args [String] :cluster_manager_timeout Operation timeout for connection to cluster-manager node.
        # @option args [String] :master_timeout DEPRECATED Explicit operation timeout for connection to cluster-manager node
        # @option args [Boolean] :wait_for_completion Should this request wait until the operation has completed before returning
        # @option args [Hash] :body Details of what to restore
        def restore(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'repository' missing" if args['repository'].nil?
          raise ArgumentError, "Required argument 'snapshot' missing" if args['snapshot'].nil?

          _repository = args.delete('repository')
          _snapshot = args.delete('snapshot')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'POST'
          url     = Utils.build_url('_snapshot', _repository, _snapshot, '_restore')

          Utils.validate_query_params! args, RESTORE_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        RESTORE_QUERY_PARAMS = Set.new(%w[
          cluster_manager_timeout
          master_timeout
          wait_for_completion
        ]).freeze
      end
    end
  end
end
