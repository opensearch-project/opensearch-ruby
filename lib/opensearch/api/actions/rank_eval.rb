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
        # Allows to evaluate the quality of ranked search results over a set of typical search queries.
        #
        # @option args [Boolean] :allow_no_indices If `false`, the request returns an error if any wildcard expression, index alias, or `_all` value targets only missing or closed indexes. This behavior applies even if the request targets other open indexes. For example, a request targeting `foo*,bar*` returns an error if an index starts with `foo` but no index starts with `bar`.
        # @option args [Enumerable<String>, String] :expand_wildcards Whether to expand wildcard expression to concrete indexes that are open, closed or both.
        # @option args [Boolean] :ignore_unavailable If `true`, missing or closed indexes are not included in the response.
        # @option args [String] :search_type Search operation type
        # @option args [Enumerable<String>, String] :index Comma-separated list of data streams, indexes, and index aliases used to limit the request. Wildcard (`*`) expressions are supported. To target all data streams and indexes in a cluster, omit this parameter or use `_all` or `*`.
        # @option args [Hash] :body *Required* The ranking evaluation search definition, including search requests, document ratings and ranking metric definition.
        def rank_eval(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'body' missing" if args['body'].nil?

          _index = args.delete('index')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = body ? 'POST' : 'GET'
          url     = Utils.build_url(_index, '_rank_eval')

          Utils.validate_query_params! args, RANK_EVAL_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        RANK_EVAL_QUERY_PARAMS = Set.new(%w[
          allow_no_indices
          expand_wildcards
          ignore_unavailable
          search_type
        ]).freeze
      end
    end
  end
end
