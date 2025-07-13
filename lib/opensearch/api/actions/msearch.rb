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
        # Allows to execute several search operations in one request.
        #
        # @option args [Boolean] :ccs_minimize_roundtrips (default: true) If `true`, network round-trips between the coordinating node and remote clusters are minimized for cross-cluster search requests.
        # @option args [Integer] :max_concurrent_searches Maximum number of concurrent searches the multi search API can execute.
        # @option args [Integer] :max_concurrent_shard_requests (default: 5) Maximum number of concurrent shard requests that each sub-search request executes per node.
        # @option args [Integer] :pre_filter_shard_size Defines a threshold that enforces a pre-filter roundtrip to prefilter search shards based on query rewriting if the number of shards the search request expands to exceeds the threshold. This filter roundtrip can limit the number of shards significantly if for instance a shard can not match any documents based on its rewrite method i.e., if date filters are mandatory to match but the shard bounds and the query are disjoint.
        # @option args [Boolean] :rest_total_hits_as_int If `true`, `hits.total` are returned as an integer in the response. Defaults to false, which returns an object.
        # @option args [String] :search_type Indicates whether global term and document frequencies should be used when scoring returned documents.
        # @option args [Boolean] :typed_keys Specifies whether aggregation and suggester names should be prefixed by their respective types in the response.
        # @option args [Enumerable<String>, String] :index A comma-separated list of data streams, indexes, and index aliases to search.
        # @option args [Enumerable<Hash>] :body *Required* The request definitions (metadata-search request definition pairs), separated by newlines
        def msearch(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'body' missing" if args['body'].nil?

          _index = args.delete('index')

          headers = (args.delete('headers') || {}).merge('Content-Type' => 'application/x-ndjson')
          body    = Utils.bulkify(args.delete('body'))
          method  = body ? 'POST' : 'GET'
          url     = Utils.build_url(_index, '_msearch')

          Utils.validate_query_params! args, MSEARCH_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        MSEARCH_QUERY_PARAMS = Set.new(%w[
          ccs_minimize_roundtrips
          max_concurrent_searches
          max_concurrent_shard_requests
          pre_filter_shard_size
          rest_total_hits_as_int
          search_type
          typed_keys
        ]).freeze
      end
    end
  end
end
