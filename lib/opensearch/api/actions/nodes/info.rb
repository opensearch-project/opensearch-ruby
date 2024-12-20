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
        # Returns information about nodes in the cluster.
        #
        # @option args [Boolean] :flat_settings If `true`, returns settings in flat format.
        # @option args [String] :timeout Period to wait for a response. If no response is received before the timeout expires, the request fails and returns an error.
        # @option args [Enumerable<String>, Enumerable<String>, String] :node_id_or_metric Limits the information returned to a list of node IDs or specific metrics. Supports a comma-separated list, such as `node1,node2` or `http,ingest`.
        # @option args [Enumerable<String>] :metric Limits the information returned to the specific metrics. Supports a comma-separated list, such as `http,ingest`.
        # @option args [Enumerable<String>, String] :node_id Comma-separated list of node IDs or names used to limit returned information.
        def info(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          _node_id_or_metric = args.delete('node_id_or_metric')
          _metric = args.delete('metric')
          _node_id = args.delete('node_id')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'GET'
          url     = Utils.build_url('_nodes', _node_id_or_metric)

          Utils.validate_query_params! args, INFO_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        INFO_QUERY_PARAMS = Set.new(%w[
          flat_settings
          timeout
        ]).freeze
      end
    end
  end
end
