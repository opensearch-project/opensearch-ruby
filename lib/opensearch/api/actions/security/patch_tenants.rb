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
        # Adds, deletes, or modifies multiple tenants in a single request.
        #
        # @option args [Enumerable<Hash>] :body *Required*
        def patch_tenants(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'body' missing" if args['body'].nil?

          headers = (args.delete('headers') || {}).merge('Content-Type' => 'application/x-ndjson')
          body    = Utils.bulkify(args.delete('body'))
          method  = 'PATCH'
          url     = '_plugins/_security/api/tenants'

          Utils.validate_query_params! args
          transport.perform_request(method, url, args, body, headers).body
        end
      end
    end
  end
end
