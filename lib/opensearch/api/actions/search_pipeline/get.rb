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
    module SearchPipeline
      module Actions
        # Retrieves information about a specified search pipeline.
        #
        # @option args [String] :cluster_manager_timeout operation timeout for connection to cluster-manager node.
        # @option args [String] :id Comma-separated list of search pipeline ids. Wildcards supported.
        def get(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          _id = args.delete('id')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'GET'
          url     = Utils.build_url('_search/pipeline', _id)

          Utils.validate_query_params! args, GET_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        GET_QUERY_PARAMS = Set.new(%w[
          cluster_manager_timeout
        ]).freeze
      end
    end
  end
end
