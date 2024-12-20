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
        # Returns information about hot threads on each node in the cluster.
        #
        # @option args [Enumerable<String>] :node_id Comma-separated list of node IDs or names to limit the returned information; use `_local` to return information from the node you're connecting to, leave empty to get information from all nodes.
        # @option args [Boolean] :ignore_idle_threads (default: true) Don't show threads that are in known-idle places, such as waiting on a socket select or pulling from an empty task queue.
        # @option args [String] :interval The interval for the second sampling of threads.
        # @option args [Integer] :snapshots (default: 10) Number of samples of thread stack trace.
        # @option args [Integer] :threads (default: 3) Specify the number of threads to provide information for.
        # @option args [String] :timeout Operation timeout.
        # @option args [String] :type The type to sample.
        def hot_threads(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          _node_id = args.delete('node_id')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'GET'
          url     = Utils.build_url('_nodes', _node_id, 'hot_threads')

          Utils.validate_query_params! args, HOT_THREADS_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        HOT_THREADS_QUERY_PARAMS = Set.new(%w[
          ignore_idle_threads
          interval
          snapshots
          threads
          timeout
          type
        ]).freeze
      end
    end
  end
end
