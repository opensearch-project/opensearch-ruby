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
        # Deletes all distinguished names in the specified cluster or node allowlist. Requires super admin or REST API permissions.
        #
        # @option args [String] :cluster_name *Required* The cluster name to delete from list of distinguished names.
        def delete_distinguished_name(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'cluster_name' missing" if args['cluster_name'].nil?

          _cluster_name = args.delete('cluster_name')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'DELETE'
          url     = Utils.build_url('_plugins/_security/api/nodesdn', _cluster_name)

          Utils.validate_query_params! args
          transport.perform_delete_request method, url, args, body, headers
        end
      end
    end
  end
end
