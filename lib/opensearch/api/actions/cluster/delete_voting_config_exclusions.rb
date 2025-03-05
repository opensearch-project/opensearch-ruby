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
        # Clears any cluster voting configuration exclusions.
        #
        # @option args [Boolean] :wait_for_removal (default: true) Specifies whether to wait for all excluded nodes to be removed from the cluster before clearing the voting configuration exclusions list. When `true`, all excluded nodes are removed from the cluster before this API takes any action. When `false`, the voting configuration exclusions list is cleared even if some excluded nodes are still in the cluster.
        def delete_voting_config_exclusions(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'DELETE'
          url     = '_cluster/voting_config_exclusions'

          Utils.validate_query_params! args, DELETE_VOTING_CONFIG_EXCLUSIONS_QUERY_PARAMS
          transport.perform_delete_request method, url, args, body, headers
        end

        DELETE_VOTING_CONFIG_EXCLUSIONS_QUERY_PARAMS = Set.new(%w[
          wait_for_removal
        ]).freeze
      end
    end
  end
end
