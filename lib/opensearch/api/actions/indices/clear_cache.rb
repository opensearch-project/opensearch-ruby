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
        # Clears all or specific caches for one or more indexes.
        #
        # @option args [Boolean] :allow_no_indices If `false`, the request returns an error if any wildcard expression, index alias, or `_all` value targets only missing or closed indexes. This behavior applies even if the request targets other open indexes.
        # @option args [Enumerable<String>, String] :expand_wildcards Type of index that wildcard patterns can match. If the request can target data streams, this argument determines whether wildcard expressions match hidden data streams. Supports comma-separated values, such as `open,hidden`. Valid values are: `all`, `open`, `closed`, `hidden`, `none`.
        # @option args [Boolean] :fielddata If `true`, clears the fields cache. Use the `fields` parameter to clear the cache of specific fields only.
        # @option args [Enumerable<String>, String] :fields Comma-separated list of field names used to limit the `fielddata` parameter.
        # @option args [Boolean] :file If `true`, clears the unused entries from the file cache on nodes with the Search role.
        # @option args [Boolean] :ignore_unavailable If `false`, the request returns an error if it targets a missing or closed index.
        # @option args [Enumerable<String>] :index Comma-separated list of indexes; use `_all` or empty string to perform the operation on all indexes.
        # @option args [Boolean] :query If `true`, clears the query cache.
        # @option args [Boolean] :request If `true`, clears the request cache.
        def clear_cache(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          _index = args.delete('index')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'POST'
          url     = Utils.build_url(_index, '_cache/clear')

          Utils.validate_query_params! args, CLEAR_CACHE_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        CLEAR_CACHE_QUERY_PARAMS = Set.new(%w[
          allow_no_indices
          expand_wildcards
          fielddata
          fields
          file
          ignore_unavailable
          query
          request
        ]).freeze
      end
    end
  end
end
