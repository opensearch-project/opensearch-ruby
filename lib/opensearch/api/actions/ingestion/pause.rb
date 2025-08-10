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
        # Use this API to pause ingestion for a given index.
        #
        # @option args [String] :index *Required* Index for which ingestion should be paused.
        # @option args [String] :cluster_manager_timeout Time to wait for cluster manager connection.
        # @option args [String] :timeout Timeout for the request.
        def pause(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'index' missing" if args['index'].nil?

          _index = args.delete('index')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'POST'
          url     = Utils.build_url(_index, 'ingestion/_pause')

          Utils.validate_query_params! args, PAUSE_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        PAUSE_QUERY_PARAMS = Set.new(%w[
          cluster_manager_timeout
          timeout
        ]).freeze
      end
    end
  end
end
