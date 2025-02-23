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
        # Provides a snapshot of how many shards are allocated to each data node and how much disk space they are using.
        #
        # @option args [String] :bytes The units used to display byte values.
        # @option args [String] :cluster_manager_timeout A timeout for connection to the cluster manager node.
        # @option args [String] :format A short version of the HTTP `Accept` header, such as `json` or `yaml`.
        # @option args [Enumerable<String>] :h A comma-separated list of column names to display.
        # @option args [Boolean] :help Returns help information.
        # @option args [Boolean] :local Returns local information but does not retrieve the state from cluster-manager node.
        # @option args [String] :master_timeout DEPRECATED A timeout for connection to the cluster manager node.
        # @option args [Enumerable<String>] :s A comma-separated list of column names or column aliases to sort by.
        # @option args [Boolean] :v Enables verbose mode, which displays column headers.
        # @option args [Enumerable<String>, String] :node_id A comma-separated list of node IDs or names used to limit the returned information.
        def allocation(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          _node_id = args.delete('node_id')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'GET'
          url     = Utils.build_url('_cat/allocation', _node_id)

          Utils.validate_query_params! args, ALLOCATION_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        ALLOCATION_QUERY_PARAMS = Set.new(%w[
          bytes
          cluster_manager_timeout
          format
          h
          help
          local
          master_timeout
          s
          v
        ]).freeze
      end
    end
  end
end
