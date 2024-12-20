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
        # Returns information about why a specific matches (or doesn't match) a query.
        #
        # @option args [String] :id *Required* Defines the document ID.
        # @option args [String] :index *Required* Index names used to limit the request. Only a single index name can be provided to this parameter.
        # @option args [Boolean, Enumerable<String>, String] :_source Set to `true` or `false` to return the `_source` field or not, or a list of fields to return.
        # @option args [Enumerable<String>, String] :_source_excludes A comma-separated list of source fields to exclude from the response.
        # @option args [Enumerable<String>, String] :_source_includes A comma-separated list of source fields to include in the response.
        # @option args [Boolean] :analyze_wildcard If `true`, wildcard and prefix queries are analyzed.
        # @option args [String] :analyzer Analyzer to use for the query string. This parameter can only be used when the `q` query string parameter is specified.
        # @option args [String] :default_operator The default operator for query string query: `AND` or `OR`.
        # @option args [String] :df (default: _all) Field to use as default where no field prefix is given in the query string.
        # @option args [Boolean] :lenient If `true`, format-based query failures (such as providing text to a numeric field) in the query string will be ignored.
        # @option args [String] :preference (default: random) Specifies the node or shard the operation should be performed on. Random by default.
        # @option args [String] :q Query in the Lucene query string syntax.
        # @option args [Enumerable<String>, String] :routing Custom value used to route operations to a specific shard.
        # @option args [Enumerable<String>, String] :stored_fields A comma-separated list of stored fields to return in the response.
        # @option args [Hash] :body The query definition using the Query DSL
        def explain(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'id' missing" if args['id'].nil?
          raise ArgumentError, "Required argument 'index' missing" if args['index'].nil?

          _id = args.delete('id')
          _index = args.delete('index')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = body ? 'POST' : 'GET'
          url     = Utils.build_url(_index, '_explain', _id)

          Utils.validate_query_params! args, EXPLAIN_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        EXPLAIN_QUERY_PARAMS = Set.new(%w[
          _source
          _source_excludes
          _source_includes
          analyze_wildcard
          analyzer
          default_operator
          df
          lenient
          preference
          q
          routing
          stored_fields
        ]).freeze
      end
    end
  end
end
