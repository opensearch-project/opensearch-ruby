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
        # Delete the specified user. Legacy API.
        #
        # @option args [String] :username *Required* The name of the user to delete.
        def delete_user_legacy(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'username' missing" if args['username'].nil?

          _username = args.delete('username')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'DELETE'
          url     = Utils.build_url('_plugins/_security/api/user', _username)

          Utils.validate_query_params! args
          transport.perform_delete_request method, url, args, body, headers
        end
      end
    end
  end
end
