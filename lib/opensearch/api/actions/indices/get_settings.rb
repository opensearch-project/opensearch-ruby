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
        # Returns settings for one or more indexes.
        #
        # @option args [Boolean] :allow_no_indices If `false`, the request returns an error if any wildcard expression, index alias, or `_all` value targets only missing or closed indexes. This behavior applies even if the request targets other open indexes. For example, a request targeting `foo*,bar*` returns an error if an index starts with foo but no index starts with `bar`.
        # @option args [String] :cluster_manager_timeout Operation timeout for connection to cluster-manager node.
        # @option args [Enumerable<String>, String] :expand_wildcards Type of index that wildcard patterns can match. If the request can target data streams, this argument determines whether wildcard expressions match hidden data streams. Supports comma-separated values, such as `open,hidden`.
        # @option args [Boolean] :flat_settings If `true`, returns settings in flat format.
        # @option args [Boolean] :ignore_unavailable If `false`, the request returns an error if it targets a missing or closed index.
        # @option args [Boolean] :include_defaults If `true`, return all default settings in the response.
        # @option args [Boolean] :local If `true`, the request retrieves information from the local node only. If `false`, information is retrieved from the cluster-manager node.
        # @option args [String] :master_timeout DEPRECATED Period to wait for a connection to the cluster-manager node. If no response is received before the timeout expires, the request fails and returns an error.
        # @option args [Enumerable<String>, String] :name A comma-separated list or wildcard expression of settings to retrieve.
        # @option args [Enumerable<String>, String] :index A comma-separated list of data streams, indexes, and aliases used to limit the request. Supports wildcards (`*`). To target all data streams and indexes, omit this parameter or use `*` or `_all`.
        def get_settings(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          _name = args.delete('name')
          _index = args.delete('index')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'GET'
          url     = Utils.build_url(_index, '_settings', _name)

          Utils.validate_query_params! args, GET_SETTINGS_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        GET_SETTINGS_QUERY_PARAMS = Set.new(%w[
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
