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
        # Returns number of documents matching a query.
        #
        # @option args [Boolean] :allow_no_indices If `false`, the request returns an error if any wildcard expression, index alias, or `_all` value targets only missing or closed indexes. This behavior applies even if the request targets other open indexes.
        # @option args [Boolean] :analyze_wildcard If `true`, wildcard and prefix queries are analyzed. This parameter can only be used when the `q` query string parameter is specified.
        # @option args [String] :analyzer Analyzer to use for the query string. This parameter can only be used when the `q` query string parameter is specified.
        # @option args [String] :default_operator The default operator for query string query: `AND` or `OR`. This parameter can only be used when the `q` query string parameter is specified.
        # @option args [String] :df Field to use as default where no field prefix is given in the query string. This parameter can only be used when the `q` query string parameter is specified.
        # @option args [Enumerable<String>, String] :expand_wildcards Specifies the type of index that wildcard expressions can match. Supports comma-separated values.
        # @option args [Boolean] :ignore_throttled If `true`, concrete, expanded or aliased indexes are ignored when frozen.
        # @option args [Boolean] :ignore_unavailable If `false`, the request returns an error if it targets a missing or closed index.
        # @option args [Boolean] :lenient If `true`, format-based query failures (such as providing text to a numeric field) in the query string will be ignored.
        # @option args [Float] :min_score Sets the minimum `_score` value that documents must have to be included in the result.
        # @option args [String] :preference (default: random) Specifies the node or shard the operation should be performed on. Random by default.
        # @option args [String] :q Query in the Lucene query string syntax.
        # @option args [Enumerable<String>, String] :routing A custom value used to route operations to a specific shard.
        # @option args [Integer] :terminate_after Maximum number of documents to collect for each shard. If a query reaches this limit, OpenSearch terminates the query early. OpenSearch collects documents before sorting.
        # @option args [Enumerable<String>, String] :index Comma-separated list of data streams, indexes, and aliases to search. Supports wildcards (`*`). To search all data streams and indexes, omit this parameter or use `*` or `_all`.
        # @option args [Hash] :body Query to restrict the results specified with the Query DSL (optional)
        def count(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          _index = args.delete('index')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = body ? 'POST' : 'GET'
          url     = Utils.build_url(_index, '_count')

          Utils.validate_query_params! args, COUNT_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        COUNT_QUERY_PARAMS = Set.new(%w[
          allow_no_indices
          analyze_wildcard
          analyzer
          default_operator
          df
          expand_wildcards
          ignore_throttled
          ignore_unavailable
          lenient
          min_score
          preference
          q
          routing
          terminate_after
        ]).freeze
      end
    end
  end
end
