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
        # Returns results matching a query.
        #
        # @option args [Boolean, Enumerable<String>, String] :_source Indicates which source fields are returned for matching documents. These fields are returned in the `hits._source` property of the search response. Valid values are: `true` to return the entire document source; `false` to not return the document source; `<string>` to return the source fields that are specified as a comma-separated list (supports wildcard (`*`) patterns).
        # @option args [Enumerable<String>, String] :_source_excludes A comma-separated list of source fields to exclude from the response. You can also use this parameter to exclude fields from the subset specified in `_source_includes` query parameter. If the `_source` parameter is `false`, this parameter is ignored.
        # @option args [Enumerable<String>, String] :_source_includes A comma-separated list of source fields to include in the response. If this parameter is specified, only these source fields are returned. You can exclude fields from this subset using the `_source_excludes` query parameter. If the `_source` parameter is `false`, this parameter is ignored.
        # @option args [Boolean] :allow_no_indices If `false`, the request returns an error if any wildcard expression, index alias, or `_all` value targets only missing or closed indexes. This behavior applies even if the request targets other open indexes. For example, a request targeting `foo*,bar*` returns an error if an index starts with `foo` but no index starts with `bar`.
        # @option args [Boolean] :allow_partial_search_results (default: true) If `true`, returns partial results if there are shard request timeouts or shard failures. If `false`, returns an error with no partial results.
        # @option args [Boolean] :analyze_wildcard If `true`, wildcard and prefix queries are analyzed. This parameter can only be used when the q query string parameter is specified.
        # @option args [String] :analyzer Analyzer to use for the query string. This parameter can only be used when the q query string parameter is specified.
        # @option args [Integer] :batched_reduce_size (default: 512) The number of shard results that should be reduced at once on the coordinating node. This value should be used as a protection mechanism to reduce the memory overhead per search request if the potential number of shards in the request can be large.
        # @option args [String] :cancel_after_time_interval The time after which the search request will be canceled. Request-level parameter takes precedence over `cancel_after_time_interval` cluster setting.
        # @option args [Boolean] :ccs_minimize_roundtrips (default: true) If `true`, network round-trips between the coordinating node and the remote clusters are minimized when executing cross-cluster search (CCS) requests.
        # @option args [String] :default_operator The default operator for query string query: AND or OR. This parameter can only be used when the `q` query string parameter is specified.
        # @option args [String] :df Field to use as default where no field prefix is given in the query string. This parameter can only be used when the q query string parameter is specified.
        # @option args [Enumerable<String>, String] :docvalue_fields A comma-separated list of fields to return as the docvalue representation for each hit.
        # @option args [Enumerable<String>, String] :expand_wildcards Type of index that wildcard patterns can match. If the request can target data streams, this argument determines whether wildcard expressions match hidden data streams. Supports comma-separated values, such as `open,hidden`.
        # @option args [Boolean] :explain If `true`, returns detailed information about score computation as part of a hit.
        # @option args [Integer] :from (default: 0) Starting document offset. Needs to be non-negative. By default, you cannot page through more than 10,000 hits using the `from` and `size` parameters. To page through more hits, use the `search_after` parameter.
        # @option args [Boolean] :ignore_throttled If `true`, concrete, expanded or aliased indexes will be ignored when frozen.
        # @option args [Boolean] :ignore_unavailable If `false`, the request returns an error if it targets a missing or closed index.
        # @option args [Boolean] :include_named_queries_score Indicates whether `hit.matched_queries` should be rendered as a map that includes the name of the matched query associated with its score (true) or as an array containing the name of the matched queries (false)
        # @option args [Boolean] :lenient If `true`, format-based query failures (such as providing text to a numeric field) in the query string will be ignored. This parameter can only be used when the `q` query string parameter is specified.
        # @option args [Integer] :max_concurrent_shard_requests (default: 5) Defines the number of concurrent shard requests per node this search executes concurrently. This value should be used to limit the impact of the search on the cluster in order to limit the number of concurrent shard requests.
        # @option args [Boolean] :phase_took Indicates whether to return phase-level `took` time values in the response.
        # @option args [Integer] :pre_filter_shard_size Defines a threshold that enforces a pre-filter roundtrip to prefilter search shards based on query rewriting if the number of shards the search request expands to exceeds the threshold. This filter roundtrip can limit the number of shards significantly if for instance a shard can not match any documents based on its rewrite method (if date filters are mandatory to match but the shard bounds and the query are disjoint). When unspecified, the pre-filter phase is executed if any of these conditions is met: the request targets more than 128 shards; the request targets one or more read-only index; the primary sort of the query targets an indexed field.
        # @option args [String] :preference (default: random) Nodes and shards used for the search. By default, OpenSearch selects from eligible nodes and shards using adaptive replica selection, accounting for allocation awareness. Valid values are: `_only_local` to run the search only on shards on the local node; `_local` to, if possible, run the search on shards on the local node, or if not, select shards using the default method; `_only_nodes:<node-id>,<node-id>` to run the search on only the specified nodes IDs, where, if suitable shards exist on more than one selected node, use shards on those nodes using the default method, or if none of the specified nodes are available, select shards from any available node using the default method; `_prefer_nodes:<node-id>,<node-id>` to if possible, run the search on the specified nodes IDs, or if not, select shards using the default method; `_shards:<shard>,<shard>` to run the search only on the specified shards; `<custom-string>` (any string that does not start with `_`) to route searches with the same `<custom-string>` to the same shards in the same order.
        # @option args [String] :q Query in the Lucene query string syntax using query parameter search. Query parameter searches do not support the full OpenSearch Query DSL but are handy for testing.
        # @option args [Boolean] :request_cache If `true`, the caching of search results is enabled for requests where `size` is `0`. Defaults to index level settings.
        # @option args [Boolean] :rest_total_hits_as_int Indicates whether `hits.total` should be rendered as an integer or an object in the rest search response.
        # @option args [Enumerable<String>, String] :routing Custom value used to route operations to a specific shard.
        # @option args [String] :scroll Period to retain the search context for scrolling. See Scroll search results. By default, this value cannot exceed `1d` (24 hours). You can change this limit using the `search.max_keep_alive` cluster-level setting.
        # @option args [String] :search_pipeline Customizable sequence of processing stages applied to search queries.
        # @option args [String] :search_type How distributed term frequencies are calculated for relevance scoring.
        # @option args [Boolean] :seq_no_primary_term If `true`, returns sequence number and primary term of the last modification of each hit.
        # @option args [Integer] :size (default: 10) Defines the number of hits to return. By default, you cannot page through more than 10,000 hits using the `from` and `size` parameters. To page through more hits, use the `search_after` parameter.
        # @option args [Enumerable<String>, String] :sort A comma-separated list of <field>:<direction> pairs.
        # @option args [Enumerable<String>] :stats Specific `tag` of the request for logging and statistical purposes.
        # @option args [Enumerable<String>, String] :stored_fields A comma-separated list of stored fields to return as part of a hit. If no fields are specified, no stored fields are included in the response. If this field is specified, the `_source` parameter defaults to `false`. You can pass `_source: true` to return both source fields and stored fields in the search response.
        # @option args [String] :suggest_field Specifies which field to use for suggestions.
        # @option args [String] :suggest_mode Specifies the suggest mode. This parameter can only be used when the `suggest_field` and `suggest_text` query string parameters are specified.
        # @option args [Integer] :suggest_size Number of suggestions to return. This parameter can only be used when the `suggest_field` and `suggest_text` query string parameters are specified.
        # @option args [String] :suggest_text The source text for which the suggestions should be returned. This parameter can only be used when the `suggest_field` and `suggest_text` query string parameters are specified.
        # @option args [Integer] :terminate_after Maximum number of documents to collect for each shard. If a query reaches this limit, OpenSearch terminates the query early. OpenSearch collects documents before sorting. Use with caution. OpenSearch applies this parameter to each shard handling the request. When possible, let OpenSearch perform early termination automatically. Avoid specifying this parameter for requests that target data streams with backing indexes across multiple data tiers. If set to `0` (default), the query does not terminate early.
        # @option args [String] :timeout Specifies the period of time to wait for a response from each shard. If no response is received before the timeout expires, the request fails and returns an error.
        # @option args [Boolean] :track_scores If `true`, calculate and return document scores, even if the scores are not used for sorting.
        # @option args [Boolean, Integer] :track_total_hits Number of hits matching the query to count accurately. If `true`, the exact number of hits is returned at the cost of some performance. If `false`, the response does not include the total number of hits matching the query.
        # @option args [Boolean] :typed_keys If `true`, aggregation and suggester names are be prefixed by their respective types in the response.
        # @option args [Boolean] :verbose_pipeline Enables or disables verbose mode for the search pipeline. When verbose mode is enabled, detailed information about each processor in the search pipeline is included in the search response. This includes the processor name, execution status, input, output, and time taken for processing. This parameter is primarily intended for debugging purposes, allowing users to track how data flows and transforms through the search pipeline.
        # @option args [Boolean] :version If `true`, returns document version as part of a hit.
        # @option args [Enumerable<String>, String] :index Comma-separated list of data streams, indexes, and aliases to search. Supports wildcards (`*`). To search all data streams and indexes, omit this parameter or use `*` or `_all`.
        # @option args [Hash] :body The search definition using the Query DSL
        def search(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          _index = args.delete('index')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = body ? 'POST' : 'GET'
          url     = Utils.build_url(_index, '_search')

          Utils.validate_query_params! args, SEARCH_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        SEARCH_QUERY_PARAMS = Set.new(%w[
          _source
          _source_excludes
          _source_includes
          allow_no_indices
          allow_partial_search_results
          analyze_wildcard
          analyzer
          batched_reduce_size
          cancel_after_time_interval
          ccs_minimize_roundtrips
          default_operator
          df
          docvalue_fields
          expand_wildcards
          explain
          from
          ignore_throttled
          ignore_unavailable
          include_named_queries_score
          lenient
          max_concurrent_shard_requests
          phase_took
          pre_filter_shard_size
          preference
          q
          request_cache
          rest_total_hits_as_int
          routing
          scroll
          search_pipeline
          search_type
          seq_no_primary_term
          size
          sort
          stats
          stored_fields
          suggest_field
          suggest_mode
          suggest_size
          suggest_text
          terminate_after
          timeout
          track_scores
          track_total_hits
          typed_keys
          verbose_pipeline
          version
        ]).freeze
      end
    end
  end
end
