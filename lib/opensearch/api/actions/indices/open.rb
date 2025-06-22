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
        # Opens an index.
        #
        # @option args [Enumerable<String>, String] :index *Required* A comma-separated list of data streams, indexes, and aliases used to limit the request. Supports wildcards (`*`). By default, you must explicitly name the indexes you using to limit the request. To limit a request using `_all`, `*`, or other wildcard expressions, change the `action.destructive_requires_name` setting to false. You can update this setting in the `opensearch.yml` file or using the cluster update settings API.
        # @option args [Boolean] :allow_no_indices If `false`, the request returns an error if any wildcard expression, index alias, or `_all` value targets only missing or closed indexes. This behavior applies even if the request targets other open indexes.
        # @option args [String] :cluster_manager_timeout Operation timeout for connection to cluster-manager node.
        # @option args [Enumerable<String>, String] :expand_wildcards Type of index that wildcard patterns can match. If the request can target data streams, this argument determines whether wildcard expressions match hidden data streams. Supports comma-separated values, such as `open,hidden`. Valid values are: `all`, `open`, `closed`, `hidden`, `none`.
        # @option args [Boolean] :ignore_unavailable If `false`, the request returns an error if it targets a missing or closed index.
        # @option args [String] :master_timeout DEPRECATED Period to wait for a connection to the cluster-manager node. If no response is received before the timeout expires, the request fails and returns an error.
        # @option args [String] :task_execution_timeout Explicit task execution timeout, only useful when `wait_for_completion` is false, defaults to `1h`.
        # @option args [String] :timeout Period to wait for a response. If no response is received before the timeout expires, the request fails and returns an error.
        # @option args [Integer, String, NilClass, String] :wait_for_active_shards The number of shard copies that must be active before proceeding with the operation. Set to `all` or any positive integer up to the total number of shards in the index (`number_of_replicas+1`).
        # @option args [Boolean] :wait_for_completion (default: true) Should this request wait until the operation has completed before returning.
        def open(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'index' missing" if args['index'].nil?

          _index = args.delete('index')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'POST'
          url     = Utils.build_url(_index, '_open')

          Utils.validate_query_params! args, OPEN_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        OPEN_QUERY_PARAMS = Set.new(%w[
          allow_no_indices
          cluster_manager_timeout
          expand_wildcards
          ignore_unavailable
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
