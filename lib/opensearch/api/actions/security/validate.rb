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
        # Checks whether the v6 security configuration is valid and ready to be migrated to v7.
        #
        # @option args [Boolean] :accept_invalid A Boolean flag to indicate whether invalid v6 configuration should be allowed.
        def validate(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'GET'
          url     = '_plugins/_security/api/validate'

          Utils.validate_query_params! args, VALIDATE_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        VALIDATE_QUERY_PARAMS = Set.new(%w[
          accept_invalid
        ]).freeze
      end
    end
  end
end
