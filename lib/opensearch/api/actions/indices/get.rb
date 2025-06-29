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
        # Returns information about one or more indexes.
        #
        # @option args [Enumerable<String>, String] :index *Required* A comma-separated list of data streams, indexes, and index aliases used to limit the request. Wildcard expressions (*) are supported.
        # @option args [Boolean] :allow_no_indices If `false`, the request returns an error if any wildcard expression, index alias, or `_all` value targets only missing or closed indexes. This behavior applies even if the request targets other open indexes. For example, a request targeting foo*,bar* returns an error if an index starts with foo but no index starts with bar.
        # @option args [String] :cluster_manager_timeout Operation timeout for connection to cluster-manager node.
        # @option args [Enumerable<String>, String] :expand_wildcards Type of index that wildcard expressions can match. If the request can target data streams, this argument determines whether wildcard expressions match hidden data streams. Supports comma-separated values, such as `open,hidden`.
        # @option args [Boolean] :flat_settings If `true`, returns settings in flat format.
        # @option args [Boolean] :ignore_unavailable If `false`, requests that target a missing index return an error.
        # @option args [Boolean] :include_defaults If `true`, return all default settings in the response.
        # @option args [Boolean] :local If `true`, the request retrieves information from the local node only. Defaults to false, which means information is retrieved from the cluster-manager node.
        # @option args [String] :master_timeout DEPRECATED Period to wait for a connection to the cluster-manager node. If no response is received before the timeout expires, the request fails and returns an error.
        def get(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'index' missing" if args['index'].nil?

          _index = args.delete('index')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'GET'
          url     = _index

          Utils.validate_query_params! args, GET_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        GET_QUERY_PARAMS = Set.new(%w[
          allow_no_indices
          cluster_manager_timeout
          expand_wildcards
          flat_settings
          ignore_unavailable
          include_defaults
          local
          master_timeout
        ]).freeze
      end
    end
  end
end
