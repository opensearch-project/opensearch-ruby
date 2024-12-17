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
        # Deletes all distinguished names in the specified cluster or node allow list. Only accessible to super-admins and with rest-api permissions when enabled.
        #
        # @option args [String] :cluster_name *Required* The cluster-name to delete from list of distinguished names.
        # @option args [List] :ignore set to [404] to ignore server's NOT FOUND error for this request
        def delete_distinguished_name(args = {})
          args = Utils.normalize_arguments(args)
          raise ArgumentError, "Required argument 'cluster_name' missing" unless args['cluster_name']

          _cluster_name = args.delete('cluster_name')

          ignore  = args.delete('ignore') || []
          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'DELETE'
          url     = ['_plugins/_security/api/nodesdn', _cluster_name].filter(&:present?).join('/').squeeze('/')

          Utils.validate_query_params args
          transport.perform_delete_request method, url, args, body, headers, ignore.include?(404)
        end
      end
    end
  end
end
