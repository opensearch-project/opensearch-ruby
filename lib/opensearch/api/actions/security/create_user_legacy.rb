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
        # Creates or replaces the specified user. Legacy API.
        #
        # @option args [String] :username *Required* The name of the user to be created.
        # @option args [Hash] :body *Required*
        def create_user_legacy(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'username' missing" if args['username'].nil?
          raise ArgumentError, "Required argument 'body' missing" if args['body'].nil?

          _username = args.delete('username')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'PUT'
          url     = Utils.build_url('_plugins/_security/api/user', _username)

          Utils.validate_query_params! args
          transport.perform_request(method, url, args, body, headers).body
        end
      end
    end
  end
end