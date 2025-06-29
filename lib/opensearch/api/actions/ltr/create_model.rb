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
        # Create or update a model in the default feature store.
        #
        # @option args [String] :id *Required* The name of the model.
        # @option args [String] :routing Specific routing value.
        # @option args [String] :store The name of the feature store.
        # @option args [Hash] :body *Required* The model definition.
        def create_model(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'id' missing" if args['id'].nil?
          raise ArgumentError, "Required argument 'body' missing" if args['body'].nil?

          _id = args.delete('id')
          _store = args.delete('store')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'PUT'
          url     = Utils.build_url('_ltr', _store, '_model', _id)

          Utils.validate_query_params! args, CREATE_MODEL_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        CREATE_MODEL_QUERY_PARAMS = Set.new(%w[
          routing
        ]).freeze
      end
    end
  end
end
