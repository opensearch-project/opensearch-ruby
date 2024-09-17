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
    module Cat
      module Actions
        # Returns basic statistics about performance of cluster nodes.
        #
        # @option args [String] :bytes The unit used to display byte values.
        # @option args [String] :cluster_manager_timeout Operation timeout for connection to cluster-manager node.
        # @option args [String] :format A short version of the Accept header (for example, `json`, `yaml`).
        # @option args [Boolean, String] :full_id If `true`, return the full node ID. If `false`, return the shortened node ID.
        # @option args [Enumerable<String>] :h Comma-separated list of column names to display.
        # @option args [Boolean] :help Return help information.
        # @option args [Boolean] :local DEPRECATED Return local information, do not retrieve the state from cluster-manager node.
        # @option args [String] :master_timeout DEPRECATED Operation timeout for connection to cluster-manager node.
        # @option args [Enumerable<String>] :s Comma-separated list of column names or column aliases to sort by.
        # @option args [String] :time The unit in which to display time values.
        # @option args [Boolean] :v Verbose mode. Display column headers.
        def nodes(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'GET'
          url     = '_cat/nodes'

          Utils.validate_query_params! args, NODES_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        NODES_QUERY_PARAMS = Set.new(%w[
          bytes
          cluster_manager_timeout
          format
          full_id
          h
          help
          local
          master_timeout
          s
          time
          v
        ]).freeze
      end
    end
  end
end
