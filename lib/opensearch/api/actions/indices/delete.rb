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
        # Deletes an index.
        #
        # @option args [Enumerable<String>, String] :index *Required* Comma-separated list of indexes to delete. You cannot specify index aliases. By default, this parameter does not support wildcards (`*`) or `_all`. To use wildcards or `_all`, set the `action.destructive_requires_name` cluster setting to `false`.
        # @option args [Boolean] :allow_no_indices If `false`, the request returns an error if any wildcard expression, index alias, or `_all` value targets only missing or closed indexes. This behavior applies even if the request targets other open indexes.
        # @option args [String] :cluster_manager_timeout Operation timeout for connection to cluster-manager node.
        # @option args [Enumerable<String>, String] :expand_wildcards Type of index that wildcard patterns can match. If the request can target data streams, this argument determines whether wildcard expressions match hidden data streams. Supports comma-separated values, such as `open,hidden`. Valid values are: `all`, `open`, `closed`, `hidden`, `none`.
        # @option args [Boolean] :ignore_unavailable If `false`, the request returns an error if it targets a missing or closed index.
        # @option args [String] :master_timeout DEPRECATED Period to wait for a connection to the cluster-manager node. If no response is received before the timeout expires, the request fails and returns an error.
        # @option args [String] :timeout Period to wait for a response. If no response is received before the timeout expires, the request fails and returns an error.
        # @option args [List] :ignore set to [404] to ignore server's NOT FOUND error for this request
        def delete(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'index' missing" if args['index'].nil?

          _index = args.delete('index')

          ignore  = args.delete('ignore') || []
          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'DELETE'
          url     = _index

          Utils.validate_query_params! args, DELETE_QUERY_PARAMS
          transport.perform_delete_request method, url, args, body, headers, ignore.include?(404)
        end

        DELETE_QUERY_PARAMS = Set.new(%w[
          allow_no_indices
          cluster_manager_timeout
          expand_wildcards
          ignore_unavailable
          master_timeout
          timeout
        ]).freeze
      end
    end
  end
end
