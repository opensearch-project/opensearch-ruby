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
        # Updates the cluster voting configuration by excluding certain node IDs or names.
        #
        # @option args [Enumerable<String>, String] :node_ids A comma-separated list of node IDs to exclude from the voting configuration. When using this setting, you cannot also specify `node_names`.
        # @option args [Enumerable<String>, String] :node_names A comma-separated list of node names to exclude from the voting configuration. When using this setting, you cannot also specify `node_ids`.
        # @option args [String] :timeout When adding a voting configuration exclusion, the API waits for the specified nodes to be excluded from the voting configuration before returning a response. If the timeout expires before the appropriate condition is satisfied, the request fails and returns an error.
        def post_voting_config_exclusions(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'POST'
          url     = '_cluster/voting_config_exclusions'

          Utils.validate_query_params! args, POST_VOTING_CONFIG_EXCLUSIONS_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        POST_VOTING_CONFIG_EXCLUSIONS_QUERY_PARAMS = Set.new(%w[
          node_ids
          node_names
          timeout
        ]).freeze
      end
    end
  end
end
