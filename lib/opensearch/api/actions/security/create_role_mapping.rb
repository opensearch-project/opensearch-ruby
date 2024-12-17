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
        # Creates or replaces the specified role mapping.
        #
        # @option args [String] :role *Required* The name of the role to create a role mapping for.
        # @option args [Hash] :body *Required*
        def create_role_mapping(args = {})
          args = Utils.normalize_arguments(args)
          raise ArgumentError, "Required argument 'role' missing" unless args['role']
          raise ArgumentError, "Required argument 'body' missing" unless args['body']

          _role = args.delete('role')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'PUT'
          url     = ['_plugins/_security/api/rolesmapping', _role].filter(&:present?).join('/').squeeze('/')

          Utils.validate_query_params args
          transport.perform_request(method, url, args, body, headers).body
        end
      end
    end
  end
end
