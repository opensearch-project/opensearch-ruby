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
    module Ingest
      module Actions
        # Allows to simulate a pipeline with example documents.
        #
        # @option args [Boolean] :verbose If `true`, the response includes output data for each processor in the executed pipeline.
        # @option args [String] :id Pipeline to test. If you don't specify a `pipeline` in the request body, this parameter is required.
        # @option args [Hash] :body *Required* The simulate definition
        def simulate(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'body' missing" if args['body'].nil?

          _id = args.delete('id')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = body ? 'POST' : 'GET'
          url     = Utils.build_url('_ingest/pipeline', _id, '_simulate')

          Utils.validate_query_params! args, SIMULATE_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        SIMULATE_QUERY_PARAMS = Set.new(%w[
          verbose
        ]).freeze
      end
    end
  end
end
