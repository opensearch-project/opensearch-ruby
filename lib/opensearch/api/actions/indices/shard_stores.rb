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
        # Provides store information for shard copies of indexes.
        #
        # @option args [Boolean] :allow_no_indices If `false`, the request returns an error if any wildcard expression, index alias, or `_all` value targets only missing or closed indexes. This behavior applies even if the request targets other open indexes.
        # @option args [Enumerable<String>, String] :expand_wildcards (default: open) Type of index that wildcard patterns can match. If the request can target data streams, this argument determines whether wildcard expressions match hidden data streams.
        # @option args [Boolean] :ignore_unavailable If `true`, missing or closed indexes are not included in the response.
        # @option args [Enumerable<String>, String] :status (default: all) List of shard health statuses used to limit the request.
        # @option args [Enumerable<String>, String] :index List of data streams, indexes, and aliases used to limit the request.
        def shard_stores(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          _index = args.delete('index')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'GET'
          url     = Utils.build_url(_index, '_shard_stores')

          Utils.validate_query_params! args, SHARD_STORES_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        SHARD_STORES_QUERY_PARAMS = Set.new(%w[
          allow_no_indices
          expand_wildcards
          ignore_unavailable
          status
        ]).freeze
      end
    end
  end
end
