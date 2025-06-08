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
    module Indices
      module Actions
        # Allows you to split an existing index into a new index with more primary shards.
        #
        # @option args [String] :index *Required* Name of the source index to split.
        # @option args [String] :target *Required* Name of the target index to create.
        # @option args [String] :cluster_manager_timeout Operation timeout for connection to cluster-manager node.
        # @option args [Boolean] :copy_settings whether or not to copy settings from the source index.
        # @option args [String] :master_timeout DEPRECATED Period to wait for a connection to the cluster-manager node. If no response is received before the timeout expires, the request fails and returns an error.
        # @option args [String] :task_execution_timeout Explicit task execution timeout, only useful when `wait_for_completion` is false, defaults to `1h`.
        # @option args [String] :timeout Period to wait for a response. If no response is received before the timeout expires, the request fails and returns an error.
        # @option args [Integer, String, NilClass, String] :wait_for_active_shards The number of shard copies that must be active before proceeding with the operation. Set to `all` or any positive integer up to the total number of shards in the index (`number_of_replicas+1`).
        # @option args [Boolean] :wait_for_completion (default: true) Should this request wait until the operation has completed before returning.
        # @option args [Hash] :body The configuration for the target index (`settings` and `aliases`)
        def split(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'index' missing" if args['index'].nil?
          raise ArgumentError, "Required argument 'target' missing" if args['target'].nil?

          _index = args.delete('index')
          _target = args.delete('target')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'POST'
          url     = Utils.build_url(_index, '_split', _target)

          Utils.validate_query_params! args, SPLIT_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        SPLIT_QUERY_PARAMS = Set.new(%w[
          cluster_manager_timeout
          copy_settings
          master_timeout
          task_execution_timeout
          timeout
          wait_for_active_shards
          wait_for_completion
        ]).freeze
      end
    end
  end
end
