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
    module Nodes
      module Actions
        # Returns low-level information about REST actions usage on nodes.
        #
        # @option args [Enumerable<String>, String] :node_id A comma-separated list of node IDs or names to limit the returned information; use `_local` to return information from the node you're connecting to, leave empty to get information from all nodes
        # @option args [String] :timeout Period to wait for a response. If no response is received before the timeout expires, the request fails and returns an error.
        # @option args [Enumerable<String>] :metric Limits the information returned to the specific metrics. A comma-separated list of the following options: `_all`, `rest_actions`.
        def usage(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          _node_id = args.delete('node_id')
          _metric = args.delete('metric')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'GET'
          url     = Utils.build_url('_nodes', _node_id, 'usage', _metric)

          Utils.validate_query_params! args, USAGE_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        USAGE_QUERY_PARAMS = Set.new(%w[
          timeout
        ]).freeze
      end
    end
  end
end
