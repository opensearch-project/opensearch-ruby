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
    module Security
      module Actions
        # Retrieves all node distinguished names. Requires super admin or REST API permissions.
        #
        # @option args [String] :cluster_name *Required* The name of the cluster to retrieve that cluster's nodes DN settings.
        # @option args [Boolean] :show_all Whether to include or exclude any static node's DN settings from the final result.
        def get_distinguished_name(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'cluster_name' missing" if args['cluster_name'].nil?

          _cluster_name = args.delete('cluster_name')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'GET'
          url     = Utils.build_url('_plugins/_security/api/nodesdn', _cluster_name)

          Utils.validate_query_params! args, GET_DISTINGUISHED_NAME_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        GET_DISTINGUISHED_NAME_QUERY_PARAMS = Set.new(%w[
          show_all
        ]).freeze
      end
    end
  end
end
