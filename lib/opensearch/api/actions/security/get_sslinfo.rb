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
        # Retrieves information about the SSL configuration.
        #
        # @option args [Boolean, String] :show_dn Whether to include all domain names in the response.
        def get_sslinfo(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'GET'
          url     = '_opendistro/_security/sslinfo'

          Utils.validate_query_params! args, GET_SSLINFO_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        GET_SSLINFO_QUERY_PARAMS = Set.new(%w[
          show_dn
        ]).freeze
      end
    end
  end
end
