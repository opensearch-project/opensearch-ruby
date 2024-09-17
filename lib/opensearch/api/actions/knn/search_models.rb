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
    module Knn
      module Actions
        # Use an OpenSearch query to search for models in the index.
        #
        # @option args [Enumerable<String>] :_source Set to `true` or `false` to return the `_source` field or not, or a list of fields to return.
        # @option args [Enumerable<String>] :_source_excludes List of fields to exclude from the returned `_source` field.
        # @option args [Enumerable<String>] :_source_includes List of fields to extract and return from the `_source` field.
        # @option args [Boolean] :allow_no_indices Whether to ignore if a wildcard indexes expression resolves into no concrete indexes. (This includes `_all` string or when no indexes have been specified).
        # @option args [Boolean] :allow_partial_search_results (default: true) Indicate if an error should be returned if there is a partial search failure or timeout.
        # @option args [Boolean] :analyze_wildcard Specify whether wildcard and prefix queries should be analyzed.
        # @option args [String] :analyzer The analyzer to use for the query string.
        # @option args [Integer] :batched_reduce_size (default: 512) The number of shard results that should be reduced at once on the coordinating node. This value should be used as a protection mechanism to reduce the memory overhead per search request if the potential number of shards in the request can be large.
        # @option args [Boolean] :ccs_minimize_roundtrips (default: true) Indicates whether network round-trips should be minimized as part of cross-cluster search requests execution.
        # @option args [String] :default_operator The default operator for query string query (AND or OR).
        # @option args [String] :df The field to use as default where no field prefix is given in the query string.
        # @option args [Enumerable<String>] :docvalue_fields Comma-separated list of fields to return as the docvalue representation of a field for each hit.
        # @option args [Enumerable<String>, String] :expand_wildcards Whether to expand wildcard expression to concrete indexes that are open, closed or both.
        # @option args [Boolean] :explain Specify whether to return detailed information about score computation as part of a hit.
        # @option args [Integer] :from (default: 0) Starting offset.
        # @option args [Boolean] :ignore_throttled Whether specified concrete, expanded or aliased indexes should be ignored when throttled.
        # @option args [Boolean] :ignore_unavailable Whether specified concrete indexes should be ignored when unavailable (missing or closed).
        # @option args [Boolean] :lenient Specify whether format-based query failures (such as providing text to a numeric field) should be ignored.
        # @option args [Integer] :max_concurrent_shard_requests (default: 5) The number of concurrent shard requests per node this search executes concurrently. This value should be used to limit the impact of the search on the cluster in order to limit the number of concurrent shard requests.
        # @option args [Integer] :pre_filter_shard_size Threshold that enforces a pre-filter round-trip to prefilter search shards based on query rewriting if the number of shards the search request expands to exceeds the threshold. This filter round-trip can limit the number of shards significantly if for instance a shard can not match any documents based on its rewrite method, that is if date filters are mandatory to match but the shard bounds and the query are disjoint.
        # @option args [String] :preference (default: random) Specify the node or shard the operation should be performed on.
        # @option args [String] :q Query in the Lucene query string syntax.
        # @option args [Boolean] :request_cache Specify if request cache should be used for this request or not, defaults to index level setting.
        # @option args [Boolean] :rest_total_hits_as_int Indicates whether `hits.total` should be rendered as an integer or an object in the rest search response.
        # @option args [Enumerable<String>, String] :routing Comma-separated list of specific routing values.
        # @option args [String] :scroll Specify how long a consistent view of the index should be maintained for scrolled search.
        # @option args [String] :search_type Search operation type.
        # @option args [Boolean] :seq_no_primary_term Specify whether to return sequence number and primary term of the last modification of each hit.
        # @option args [Integer] :size (default: 10) Number of hits to return.
        # @option args [Enumerable<String>] :sort Comma-separated list of <field>:<direction> pairs.
        # @option args [Enumerable<String>] :stats Specific 'tag' of the request for logging and statistical purposes.
        # @option args [Enumerable<String>] :stored_fields Comma-separated list of stored fields to return.
        # @option args [String] :suggest_field Specify which field to use for suggestions.
        # @option args [String] :suggest_mode Specify suggest mode.
        # @option args [Integer] :suggest_size How many suggestions to return in response.
        # @option args [String] :suggest_text The source text for which the suggestions should be returned.
        # @option args [Integer] :terminate_after The maximum number of documents to collect for each shard, upon reaching which the query execution will terminate early.
        # @option args [String] :timeout Operation timeout.
        # @option args [Boolean] :track_scores Whether to calculate and return scores even if they are not used for sorting.
        # @option args [Boolean] :track_total_hits Indicate if the number of documents that match the query should be tracked.
        # @option args [Boolean] :typed_keys Specify whether aggregation and suggester names should be prefixed by their respective types in the response.
        # @option args [Boolean] :version Whether to return document version as part of a hit.
        # @option args [Hash] :body
        def search_models(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = body ? 'POST' : 'GET'
          url     = '_plugins/_knn/models/_search'

          Utils.validate_query_params! args, SEARCH_MODELS_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        SEARCH_MODELS_QUERY_PARAMS = Set.new(%w[
          _source
          _source_excludes
          _source_includes
          allow_no_indices
          allow_partial_search_results
          analyze_wildcard
          analyzer
          batched_reduce_size
          ccs_minimize_roundtrips
          default_operator
          df
          docvalue_fields
          expand_wildcards
          explain
          from
          ignore_throttled
          ignore_unavailable
          lenient
          max_concurrent_shard_requests
          pre_filter_shard_size
          preference
          q
          request_cache
          rest_total_hits_as_int
          routing
          scroll
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
          version
        ]).freeze
      end
    end
  end
end
