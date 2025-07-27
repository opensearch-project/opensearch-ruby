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
        # Add features to an existing feature set in the default feature store.
        #
        # @option args [String] :name *Required* The name of the feature set to add features to.
        # @option args [String] :query *Required* Query string to filter existing features from the store by name. When provided, only features matching this query will be added to the feature set, and no request body should be included.
        # @option args [Boolean] :merge Whether to merge the feature list or append only.
        # @option args [String] :routing Specific routing value.
        # @option args [Integer] :version Version check to ensure feature set is modified with expected version.
        # @option args [String] :store The name of the feature store.
        def add_features_to_set_by_query(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'name' missing" if args['name'].nil?
          raise ArgumentError, "Required argument 'query' missing" if args['query'].nil?

          _name = args.delete('name')
          _query = args.delete('query')
          _store = args.delete('store')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'POST'
          url     = Utils.build_url('_ltr', _store, '_featureset', _name, '_addfeatures', _query)

          Utils.validate_query_params! args, ADD_FEATURES_TO_SET_BY_QUERY_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        ADD_FEATURES_TO_SET_BY_QUERY_QUERY_PARAMS = Set.new(%w[
          merge
          routing
          version
        ]).freeze
      end
    end
  end
end
