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
    module Ingestion
      module Actions
        # Use this API to retrieve the ingestion state for a given index.
        #
        # @option args [String] :index *Required* Index for which ingestion state should be retrieved.
        # @option args [String] :next_token Token to retrieve the next page of results.
        # @option args [Integer] :size Number of results to return per page.
        # @option args [String] :timeout Timeout for the request.
        def get_state(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'index' missing" if args['index'].nil?

          _index = args.delete('index')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'GET'
          url     = Utils.build_url(_index, 'ingestion/_state')

          Utils.validate_query_params! args, GET_STATE_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        GET_STATE_QUERY_PARAMS = Set.new(%w[
          next_token
          size
          timeout
        ]).freeze
      end
    end
  end
end
