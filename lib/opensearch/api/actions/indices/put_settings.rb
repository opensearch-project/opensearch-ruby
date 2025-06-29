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
        # Updates the index settings.
        #
        # @option args [Boolean] :allow_no_indices If `false`, the request returns an error if any wildcard expression, index alias, or `_all` value targets only missing or closed indexes. This behavior applies even if the request targets other open indexes. For example, a request targeting `foo*,bar*` returns an error if an index starts with `foo` but no index starts with `bar`.
        # @option args [String] :cluster_manager_timeout Operation timeout for connection to cluster-manager node.
        # @option args [Enumerable<String>, String] :expand_wildcards Type of index that wildcard patterns can match. If the request can target data streams, this argument determines whether wildcard expressions match hidden data streams. Supports comma-separated values, such as `open,hidden`.
        # @option args [Boolean] :flat_settings If `true`, returns settings in flat format.
        # @option args [Boolean] :ignore_unavailable Whether specified concrete indexes should be ignored when unavailable (missing or closed).
        # @option args [String] :master_timeout DEPRECATED Period to wait for a connection to the cluster-manager node. If no response is received before the timeout expires, the request fails and returns an error.
        # @option args [Boolean] :preserve_existing If `true`, existing index settings remain unchanged.
        # @option args [String] :timeout Period to wait for a response. If no response is received before the  timeout expires, the request fails and returns an error.
        # @option args [Enumerable<String>, String] :index A comma-separated list of data streams, indexes, and aliases used to limit the request. Supports wildcards (`*`). To target all data streams and indexes, omit this parameter or use `*` or `_all`.
        # @option args [Hash] :body *Required* The configuration settings for an index.
        def put_settings(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'body' missing" if args['body'].nil?

          _index = args.delete('index')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'PUT'
          url     = Utils.build_url(_index, '_settings')

          Utils.validate_query_params! args, PUT_SETTINGS_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        PUT_SETTINGS_QUERY_PARAMS = Set.new(%w[
          allow_no_indices
          cluster_manager_timeout
          expand_wildcards
          flat_settings
          ignore_unavailable
          master_timeout
          preserve_existing
          timeout
        ]).freeze
      end
    end
  end
end
