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
    module Sm
      module Actions
        # Retrieves all snapshot management policies with optional pagination and filtering.
        #
        # @option args [Integer] :from The starting index (default: 0)
        # @option args [String] :queryString A query string to filter policies.
        # @option args [Integer] :size The number of policies to return.
        # @option args [String] :sortField The field to sort on.
        # @option args [String] :sortOrder (default: asc) The order of sorting.
        def get_policies(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'GET'
          url     = '_plugins/_sm/policies'

          Utils.validate_query_params! args, GET_POLICIES_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        GET_POLICIES_QUERY_PARAMS = Set.new(%w[
          from
          queryString
          size
          sortField
          sortOrder
        ]).freeze
      end
    end
  end
end
