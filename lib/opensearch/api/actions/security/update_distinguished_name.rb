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
        # Adds or updates the specified distinguished names in the cluster or node allow list. Only accessible to super-admins and with rest-api permissions when enabled.
        #
        # @option args [String] :cluster_name *Required* The cluster-name to create/update `nodesDn` value for.
        # @option args [Hash] :body
        def update_distinguished_name(args = {})
          args = Utils.normalize_arguments(args)
          raise ArgumentError, "Required argument 'cluster_name' missing" unless args['cluster_name']

          _cluster_name = args.delete('cluster_name')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'PUT'
          url     = ['_plugins/_security/api/nodesdn', _cluster_name].filter(&:present?).join('/').squeeze('/')

          Utils.validate_query_params args
          transport.perform_request(method, url, args, body, headers).body
        end
      end
    end
  end
end
