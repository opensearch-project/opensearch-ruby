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
        # Allows a user to validate a potentially expensive query without executing it.
        #
        # @option args [Boolean] :all_shards If `true`, the validation is executed on all shards instead of one random shard per index.
        # @option args [Boolean] :allow_no_indices If `false`, the request returns an error if any wildcard expression, index alias, or `_all` value targets only missing or closed indexes. This behavior applies even if the request targets other open indexes.
        # @option args [Boolean] :analyze_wildcard If `true`, wildcard and prefix queries are analyzed.
        # @option args [String] :analyzer Analyzer to use for the query string. This parameter can only be used when the `q` query string parameter is specified.
        # @option args [String] :default_operator The default operator for query string query: `AND` or `OR`.
        # @option args [String] :df Field to use as default where no field prefix is given in the query string. This parameter can only be used when the `q` query string parameter is specified.
        # @option args [Enumerable<String>, String] :expand_wildcards Type of index that wildcard patterns can match. If the request can target data streams, this argument determines whether wildcard expressions match hidden data streams. Supports comma-separated values, such as `open,hidden`. Valid values are: `all`, `open`, `closed`, `hidden`, `none`.
        # @option args [Boolean] :explain If `true`, the response returns detailed information if an error has occurred.
        # @option args [Boolean] :ignore_unavailable If `false`, the request returns an error if it targets a missing or closed index.
        # @option args [Boolean] :lenient If `true`, format-based query failures (such as providing text to a numeric field) in the query string will be ignored.
        # @option args [String] :q Query in the Lucene query string syntax.
        # @option args [Boolean] :rewrite If `true`, returns a more detailed explanation showing the actual Lucene query that will be executed.
        # @option args [Enumerable<String>, String] :index Comma-separated list of data streams, indexes, and aliases to search. Supports wildcards (`*`). To search all data streams or indexes, omit this parameter or use `*` or `_all`.
        # @option args [Hash] :body The query definition specified with the Query DSL
        def validate_query(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          _index = args.delete('index')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = body ? 'POST' : 'GET'
          url     = Utils.build_url(_index, '_validate/query')

          Utils.validate_query_params! args, VALIDATE_QUERY_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        VALIDATE_QUERY_QUERY_PARAMS = Set.new(%w[
          all_shards
          allow_no_indices
          analyze_wildcard
          analyzer
          default_operator
          df
          expand_wildcards
          explain
          ignore_unavailable
          lenient
          q
          rewrite
        ]).freeze
      end
    end
  end
end
