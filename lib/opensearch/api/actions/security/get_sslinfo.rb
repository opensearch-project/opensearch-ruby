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
        # Retrieves the SSL configuration information.
        #
        # @option args [Hash] :show_dn A Boolean flag to indicate whether all domain names should be returned.
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
