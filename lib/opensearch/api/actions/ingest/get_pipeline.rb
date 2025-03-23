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
        # Returns an ingest pipeline.
        #
        # @option args [String] :cluster_manager_timeout The amount of time allowed to establish a connection to the cluster manager node.
        # @option args [String] :master_timeout DEPRECATED Period to wait for a connection to the cluster-manager node. If no response is received before the timeout expires, the request fails and returns an error.
        # @option args [String] :id A comma-separated list of pipeline IDs to retrieve. Wildcard (`*`) expressions are supported. To get all ingest pipelines, omit this parameter or use `*`.
        def get_pipeline(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          _id = args.delete('id')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'GET'
          url     = Utils.build_url('_ingest/pipeline', _id)

          Utils.validate_query_params! args, GET_PIPELINE_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        GET_PIPELINE_QUERY_PARAMS = Set.new(%w[
          cluster_manager_timeout
          master_timeout
        ]).freeze
      end
    end
  end
end
