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
    module Transforms
      module Actions
        # Returns the details of all transform jobs.
        #
        # @option args [Float] :from The starting transform to return. Default is `0`.
        # @option args [String] :search The search term to use to filter results.
        # @option args [Float] :size Specifies the number of transforms to return. Default is `10`.
        # @option args [String] :sortDirection Specifies the direction to sort results in. Can be `ASC` or `DESC`. Default is `ASC`.
        # @option args [String] :sortField The field to sort results with.
        def search(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'GET'
          url     = '_plugins/_transform'

          Utils.validate_query_params! args, SEARCH_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        SEARCH_QUERY_PARAMS = Set.new(%w[
          from
          search
          size
          sortDirection
          sortField
        ]).freeze
      end
    end
  end
end
