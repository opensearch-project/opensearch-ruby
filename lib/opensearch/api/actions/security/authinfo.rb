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
        # Returns or updates authentication information for the currently authenticated user.
        #
        # @option args [String] :auth_type The type of the current authentication request.
        # @option args [Boolean] :verbose Whether to return a verbose response.
        def authinfo(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = body ? 'POST' : 'GET'
          url     = '_plugins/_security/authinfo'

          Utils.validate_query_params! args, AUTHINFO_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        AUTHINFO_QUERY_PARAMS = Set.new(%w[
          auth_type
          verbose
        ]).freeze
      end
    end
  end
end
