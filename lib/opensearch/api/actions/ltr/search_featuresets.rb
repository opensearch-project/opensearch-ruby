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
    module Ltr
      module Actions
        # Search for feature sets in a feature store.
        #
        # @option args [Integer] :from (default: 0) The offset from the first result (for pagination).
        # @option args [String] :prefix A name prefix to filter feature sets by.
        # @option args [Integer] :size (default: 20) The number of feature sets to return.
        # @option args [String] :store The name of the feature store.
        def search_featuresets(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          _store = args.delete('store')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'GET'
          url     = Utils.build_url('_ltr', _store, '_featureset')

          Utils.validate_query_params! args, SEARCH_FEATURESETS_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        SEARCH_FEATURESETS_QUERY_PARAMS = Set.new(%w[
          from
          prefix
          size
        ]).freeze
      end
    end
  end
end
