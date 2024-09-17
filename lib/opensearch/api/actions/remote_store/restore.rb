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
    module RemoteStore
      module Actions
        # Restores from remote store.
        #
        # @option args [String] :cluster_manager_timeout Operation timeout for connection to cluster-manager node.
        # @option args [Boolean] :wait_for_completion Should this request wait until the operation has completed before returning.
        # @option args [Hash] :body *Required* Comma-separated list of index IDs
        def restore(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'body' missing" if args['body'].nil?

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'POST'
          url     = '_remotestore/_restore'

          Utils.validate_query_params! args, RESTORE_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        RESTORE_QUERY_PARAMS = Set.new(%w[
          cluster_manager_timeout
          wait_for_completion
        ]).freeze
      end
    end
  end
end
