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
    module Knn
      module Actions
        # Create and train a model that can be used for initializing k-NN native library indexes during indexing.
        #
        # @option args [String] :preference Preferred node to execute training.
        # @option args [String] :model_id The id of the model.
        # @option args [Hash] :body
        def train_model(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          _model_id = args.delete('model_id')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'POST'
          url     = Utils.build_url('_plugins/_knn/models', _model_id, '_train')

          Utils.validate_query_params! args, TRAIN_MODEL_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        TRAIN_MODEL_QUERY_PARAMS = Set.new(%w[
          preference
        ]).freeze
      end
    end
  end
end
