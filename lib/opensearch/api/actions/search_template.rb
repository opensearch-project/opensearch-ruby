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
        # Allows to use the Mustache language to pre-render a search definition.
        #
        # @option args [Boolean] :allow_no_indices If `false`, the request returns an error if any wildcard expression, index alias, or `_all` value targets only missing or closed indexes. This behavior applies even if the request targets other open indexes. For example, a request targeting `foo*,bar*` returns an error if an index starts with `foo` but no index starts with `bar`.
        # @option args [Boolean] :ccs_minimize_roundtrips (default: true) If `true`, network round-trips are minimized for cross-cluster search requests.
        # @option args [Enumerable<String>, String] :expand_wildcards Type of index that wildcard patterns can match. If the request can target data streams, this argument determines whether wildcard expressions match hidden data streams. Supports comma-separated values, such as `open,hidden`. Valid values are: `all`, `open`, `closed`, `hidden`, `none`.
        # @option args [Boolean] :explain If `true`, the response includes additional details about score computation as part of a hit.
        # @option args [Boolean] :ignore_throttled If `true`, specified concrete, expanded, or aliased indexes are not included in the response when throttled.
        # @option args [Boolean] :ignore_unavailable If `false`, the request returns an error if it targets a missing or closed index.
        # @option args [Boolean] :phase_took Indicates whether to return phase-level `took` time values in the response.
        # @option args [String] :preference (default: random) Specifies the node or shard the operation should be performed on. Random by default.
        # @option args [Boolean] :profile If `true`, the query execution is profiled.
        # @option args [Boolean] :rest_total_hits_as_int If `true`, `hits.total` are rendered as an integer in the response.
        # @option args [Enumerable<String>, String] :routing A custom value used to route operations to a specific shard.
        # @option args [String] :scroll Specifies how long a consistent view of the index should be maintained for scrolled search.
        # @option args [String] :search_pipeline Customizable sequence of processing stages applied to search queries.
        # @option args [String] :search_type The type of the search operation.
        # @option args [Boolean] :typed_keys If `true`, the response prefixes aggregation and suggester names with their respective types.
        # @option args [Enumerable<String>, String] :index A comma-separated list of data streams, indexes, and aliases to search. Supports wildcards (*).
        # @option args [Hash] :body *Required* The search definition template and its parameters.
        def search_template(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'body' missing" if args['body'].nil?

          _index = args.delete('index')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = body ? 'POST' : 'GET'
          url     = Utils.build_url(_index, '_search/template')

          Utils.validate_query_params! args, SEARCH_TEMPLATE_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        SEARCH_TEMPLATE_QUERY_PARAMS = Set.new(%w[
          allow_no_indices
          ccs_minimize_roundtrips
          expand_wildcards
          explain
          ignore_throttled
          ignore_unavailable
          phase_took
          preference
          profile
          rest_total_hits_as_int
          routing
          scroll
          search_pipeline
          search_type
          typed_keys
        ]).freeze
      end
    end
  end
end
