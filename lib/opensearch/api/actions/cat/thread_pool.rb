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
        # Returns cluster-wide thread pool statistics per node.
        # By default the active, queue and rejected statistics are returned for all thread pools.
        #
        # @option args [String] :cluster_manager_timeout Operation timeout for connection to cluster-manager node.
        # @option args [String] :format A short version of the Accept header (for example, `json`, `yaml`).
        # @option args [Enumerable<String>] :h Comma-separated list of column names to display.
        # @option args [Boolean] :help Return help information.
        # @option args [Boolean] :local Return local information, do not retrieve the state from cluster-manager node.
        # @option args [String] :master_timeout DEPRECATED Operation timeout for connection to cluster-manager node.
        # @option args [Enumerable<String>] :s Comma-separated list of column names or column aliases to sort by.
        # @option args [Integer] :size The multiplier in which to display values.
        # @option args [Boolean] :v Verbose mode. Display column headers.
        # @option args [Enumerable<String>, String] :thread_pool_patterns A comma-separated list of thread pool names used to limit the request. Accepts wildcard expressions.
        def thread_pool(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          _thread_pool_patterns = args.delete('thread_pool_patterns')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'GET'
          url     = Utils.build_url('_cat/thread_pool', _thread_pool_patterns)

          Utils.validate_query_params! args, THREAD_POOL_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        THREAD_POOL_QUERY_PARAMS = Set.new(%w[
          cluster_manager_timeout
          format
          h
          help
          local
          master_timeout
          s
          size
          v
        ]).freeze
      end
    end
  end
end
