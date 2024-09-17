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
        # Retrieves distinguished names. Only accessible to super-admins and with rest-api permissions when enabled.
        #
        # @option args [Boolean] :show_all A Boolean flag to include/exclude static nodes DN from final result.
        def get_distinguished_names(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'GET'
          url     = '_plugins/_security/api/nodesdn'

          Utils.validate_query_params! args, GET_DISTINGUISHED_NAMES_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        GET_DISTINGUISHED_NAMES_QUERY_PARAMS = Set.new(%w[
          show_all
        ]).freeze
      end
    end
  end
end
