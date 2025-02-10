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
    module Ml
      module Actions
        # Uploads model chunk.
        #
        # @option args [Integer] :chunk_number *Required*
        # @option args [String] :model_id *Required*
        # @option args [Hash] :body
        def upload_chunk(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'chunk_number' missing" if args['chunk_number'].nil?
          raise ArgumentError, "Required argument 'model_id' missing" if args['model_id'].nil?

          _chunk_number = args.delete('chunk_number')
          _model_id = args.delete('model_id')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'POST'
          url     = Utils.build_url('_plugins/_ml/models', _model_id, 'upload_chunk', _chunk_number)

          Utils.validate_query_params! args
          transport.perform_request(method, url, args, body, headers).body
        end
      end
    end
  end
end
