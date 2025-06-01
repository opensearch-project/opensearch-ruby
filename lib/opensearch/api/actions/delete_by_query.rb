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
    module Root
      module Actions
        # Deletes documents matching the provided query.
        #
        # @option args [Enumerable<String>, String] :index *Required* Comma-separated list of data streams, indexes, and aliases to search. Supports wildcards (`*`). To search all data streams or indexes, omit this parameter or use `*` or `_all`.
        # @option args [Boolean, Enumerable<String>, String] :_source Set to `true` or `false` to return the `_source` field or not, or a list of fields to return.
        # @option args [Enumerable<String>] :_source_excludes List of fields to exclude from the returned `_source` field.
        # @option args [Enumerable<String>] :_source_includes List of fields to extract and return from the `_source` field.
        # @option args [Boolean] :allow_no_indices If `false`, the request returns an error if any wildcard expression, index alias, or `_all` value targets only missing or closed indexes. This behavior applies even if the request targets other open indexes. For example, a request targeting `foo*,bar*` returns an error if an index starts with `foo` but no index starts with `bar`.
        # @option args [Boolean] :analyze_wildcard If `true`, wildcard and prefix queries are analyzed.
        # @option args [String] :analyzer Analyzer to use for the query string.
        # @option args [String] :conflicts What to do if delete by query hits version conflicts: `abort` or `proceed`.
        # @option args [String] :default_operator The default operator for query string query: `AND` or `OR`.
        # @option args [String] :df Field to use as default where no field prefix is given in the query string.
        # @option args [Enumerable<String>, String] :expand_wildcards Type of index that wildcard patterns can match. If the request can target data streams, this argument determines whether wildcard expressions match hidden data streams. Supports comma-separated values, such as `open,hidden`. Valid values are: `all`, `open`, `closed`, `hidden`, `none`.
        # @option args [Integer] :from (default: 0) Starting offset.
        # @option args [Boolean] :ignore_unavailable If `false`, the request returns an error if it targets a missing or closed index.
        # @option args [Boolean] :lenient If `true`, format-based query failures (such as providing text to a numeric field) in the query string will be ignored.
        # @option args [Integer] :max_docs Maximum number of documents to process. Defaults to all documents.
        # @option args [String] :preference (default: random) Specifies the node or shard the operation should be performed on. Random by default.
        # @option args [String] :q Query in the Lucene query string syntax.
        # @option args [Boolean, String] :refresh If `true`, OpenSearch refreshes all shards involved in the delete by query after the request completes.
        # @option args [Boolean] :request_cache If `true`, the request cache is used for this request. Defaults to the index-level setting.
        # @option args [Float] :requests_per_second (default: 0) The throttle for this request in sub-requests per second.
        # @option args [Enumerable<String>, String] :routing Custom value used to route operations to a specific shard.
        # @option args [String] :scroll Period to retain the search context for scrolling.
        # @option args [Integer] :scroll_size (default: 100) Size of the scroll request that powers the operation.
        # @option args [String] :search_timeout Explicit timeout for each search request. Defaults to no timeout.
        # @option args [String] :search_type The type of the search operation. Available options: `query_then_fetch`, `dfs_query_then_fetch`.
        # @option args [Integer] :size Deprecated, use `max_docs` instead.
        # @option args [Integer, String] :slices The number of slices this task should be divided into.
        # @option args [Enumerable<String>] :sort A comma-separated list of <field>:<direction> pairs.
        # @option args [Enumerable<String>] :stats Specific `tag` of the request for logging and statistical purposes.
        # @option args [Integer] :terminate_after Maximum number of documents to collect for each shard. If a query reaches this limit, OpenSearch terminates the query early. OpenSearch collects documents before sorting. Use with caution. OpenSearch applies this parameter to each shard handling the request. When possible, let OpenSearch perform early termination automatically. Avoid specifying this parameter for requests that target data streams with backing indexes across multiple data tiers.
        # @option args [String] :timeout Period each deletion request waits for active shards.
        # @option args [Boolean] :version If `true`, returns the document version as part of a hit.
        # @option args [Integer, String, NilClass, String] :wait_for_active_shards The number of shard copies that must be active before proceeding with the operation. Set to all or any positive integer up to the total number of shards in the index (`number_of_replicas+1`).
        # @option args [Boolean] :wait_for_completion (default: true) If `true`, the request blocks until the operation is complete.
        # @option args [Hash] :body *Required* The search definition using the Query DSL
        def delete_by_query(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'index' missing" if args['index'].nil?
          raise ArgumentError, "Required argument 'body' missing" if args['body'].nil?

          _index = args.delete('index')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'POST'
          url     = Utils.build_url(_index, '_delete_by_query')

          Utils.validate_query_params! args, DELETE_BY_QUERY_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        DELETE_BY_QUERY_QUERY_PARAMS = Set.new(%w[
          _source
          _source_excludes
          _source_includes
          allow_no_indices
          analyze_wildcard
          analyzer
          conflicts
          default_operator
          df
          expand_wildcards
          from
          ignore_unavailable
          lenient
          max_docs
          preference
          q
          refresh
          request_cache
          requests_per_second
          routing
          scroll
          scroll_size
          search_timeout
          search_type
          size
          slices
          sort
          stats
          terminate_after
          timeout
          version
          wait_for_active_shards
          wait_for_completion
        ]).freeze
      end
    end
  end
end
