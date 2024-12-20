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
        # Create an index transform, or update a transform if `if_seq_no` and `if_primary_term` are provided.
        #
        # @option args [String] :id *Required* Transform to create/update
        # @option args [Float] :if_primary_term Only perform the operation if the document has this primary term.
        # @option args [Integer] :if_seq_no Only perform the operation if the document has this sequence number.
        # @option args [Hash] :body
        def put(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'id' missing" if args['id'].nil?

          _id = args.delete('id')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'PUT'
          url     = Utils.build_url('_plugins/_transform', _id)

          Utils.validate_query_params! args, PUT_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        PUT_QUERY_PARAMS = Set.new(%w[
          if_primary_term
          if_seq_no
        ]).freeze
      end
    end
  end
end
