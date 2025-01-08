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
        # Adds a block to an index.
        #
        # @option args [String] :block *Required* The block to add (one of `read`, `write`, `read_only` or `metadata`).
        # @option args [Enumerable<String>, String] :index *Required* A comma separated list of indexes to add a block to.
        # @option args [Boolean] :allow_no_indices Whether to ignore if a wildcard indexes expression resolves into no concrete indexes. (This includes `_all` string or when no indexes have been specified).
        # @option args [String] :cluster_manager_timeout Operation timeout for connection to cluster-manager node.
        # @option args [Enumerable<String>, String] :expand_wildcards Whether to expand wildcard expression to concrete indexes that are open, closed or both.
        # @option args [Boolean] :ignore_unavailable Whether specified concrete indexes should be ignored when unavailable (missing or closed).
        # @option args [String] :master_timeout DEPRECATED Specify timeout for connection to cluster manager.
        # @option args [String] :timeout Explicit operation timeout
        def add_block(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'block' missing" if args['block'].nil?
          raise ArgumentError, "Required argument 'index' missing" if args['index'].nil?

          _block = args.delete('block')
          _index = args.delete('index')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'PUT'
          url     = Utils.build_url(_index, '_block', _block)

          Utils.validate_query_params! args, ADD_BLOCK_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        ADD_BLOCK_QUERY_PARAMS = Set.new(%w[
          allow_no_indices
          cluster_manager_timeout
          expand_wildcards
          ignore_unavailable
          master_timeout
          timeout
        ]).freeze
      end
    end
  end
end
