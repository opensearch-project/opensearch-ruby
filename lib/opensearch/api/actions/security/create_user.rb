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
        # Creates or replaces the specified user.
        #
        # @option args [String] :username *Required* The name of the user to be created.
        # @option args [Hash] :body *Required*
        def create_user(args = {})
          args = Utils.normalize_arguments(args)
          raise ArgumentError, "Required argument 'username' missing" unless args['username']
          raise ArgumentError, "Required argument 'body' missing" unless args['body']

          _username = args.delete('username')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'PUT'
          url     = ['_plugins/_security/api/internalusers', _username].filter(&:present?).join('/').squeeze('/')

          Utils.validate_query_params args
          transport.perform_request(method, url, args, body, headers).body
        end
      end
    end
  end
end
