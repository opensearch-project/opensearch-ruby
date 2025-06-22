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
        # Allows to execute several search template operations in one request.
        #
        # @option args [Boolean] :ccs_minimize_roundtrips (default: true) If `true`, network round-trips are minimized for cross-cluster search requests.
        # @option args [Integer] :max_concurrent_searches Maximum number of concurrent searches the API can run.
        # @option args [Boolean] :rest_total_hits_as_int If `true`, the response returns `hits.total` as an integer. If `false`, it returns `hits.total` as an object.
        # @option args [String] :search_type The type of the search operation. Available options: `query_then_fetch`, `dfs_query_then_fetch`.
        # @option args [Boolean] :typed_keys If `true`, the response prefixes aggregation and suggester names with their respective types.
        # @option args [Enumerable<String>, String] :index A comma-separated list of data streams, indexes, and aliases to search. Supports wildcards (`*`). To search all data streams and indexes, omit this parameter or use `*`.
        # @option args [Enumerable<Hash>] :body *Required* The request definitions (metadata-search request definition pairs), separated by newlines
        def msearch_template(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'body' missing" if args['body'].nil?

          _index = args.delete('index')

          headers = (args.delete('headers') || {}).merge('Content-Type' => 'application/x-ndjson')
          body    = Utils.bulkify(args.delete('body'))
          method  = body ? 'POST' : 'GET'
          url     = Utils.build_url(_index, '_msearch/template')

          Utils.validate_query_params! args, MSEARCH_TEMPLATE_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        MSEARCH_TEMPLATE_QUERY_PARAMS = Set.new(%w[
          ccs_minimize_roundtrips
          max_concurrent_searches
          rest_total_hits_as_int
          search_type
          typed_keys
        ]).freeze
      end
    end
  end
end
