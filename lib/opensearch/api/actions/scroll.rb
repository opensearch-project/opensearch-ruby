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
    module Root
      module Actions
        # Allows to retrieve a large numbers of results from a single search request.
        #
        # @option args [Boolean] :rest_total_hits_as_int If `true`, the API response's `hit.total` property is returned as an integer. If `false`, the API response's `hit.total` property is returned as an object.
        # @option args [String] :scroll Period to retain the search context for scrolling.
        # @option args [String] :scroll_id DEPRECATED The scroll ID for scrolled search
        # @option args [Hash] :body
        def scroll(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          _scroll_id = args.delete('scroll_id')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = body ? 'POST' : 'GET'
          url     = Utils.build_url('_search/scroll', _scroll_id)

          Utils.validate_query_params! args, SCROLL_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        SCROLL_QUERY_PARAMS = Set.new(%w[
          rest_total_hits_as_int
          scroll
        ]).freeze
      end
    end
  end
end
