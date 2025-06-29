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
        # Create a model from an existing feature set in the default feature store.
        #
        # @option args [String] :name *Required* The name of the feature set to use for creating the model.
        # @option args [String] :routing Specific routing value.
        # @option args [String] :store The name of the feature store.
        # @option args [Hash] :body *Required* The model definition for creating from a feature set.
        def create_model_from_set(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'name' missing" if args['name'].nil?
          raise ArgumentError, "Required argument 'body' missing" if args['body'].nil?

          _name = args.delete('name')
          _store = args.delete('store')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'POST'
          url     = Utils.build_url('_ltr', _store, '_featureset', _name, '_createmodel')

          Utils.validate_query_params! args, CREATE_MODEL_FROM_SET_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        CREATE_MODEL_FROM_SET_QUERY_PARAMS = Set.new(%w[
          routing
        ]).freeze
      end
    end
  end
end
