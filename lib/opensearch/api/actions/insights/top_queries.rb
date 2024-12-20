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
    module Insights
      module Actions
        # Retrieves the top queries based on the given metric type (latency, CPU, or memory).
        #
        # @option args [String] :type *Required* Get top n queries by a specific metric.
        def top_queries(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'type' missing" if args['type'].nil?

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'GET'
          url     = '_insights/top_queries'

          Utils.validate_query_params! args, TOP_QUERIES_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        TOP_QUERIES_QUERY_PARAMS = Set.new(%w[
          type
        ]).freeze
      end
    end
  end
end
