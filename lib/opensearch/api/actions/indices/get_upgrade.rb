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
        # The `_upgrade` API is no longer useful and will be removed.
        #
        # @option args [Boolean] :allow_no_indices Whether to ignore if a wildcard indexes expression resolves into no concrete indexes. (This includes `_all` string or when no indexes have been specified).
        # @option args [Enumerable<String>, String] :expand_wildcards Whether to expand wildcard expression to concrete indexes that are open, closed or both.
        # @option args [Boolean] :ignore_unavailable Whether specified concrete indexes should be ignored when unavailable (missing or closed).
        # @option args [Enumerable<String>] :index A comma-separated list of indexes; use `_all` or empty string to perform the operation on all indexes.
        def get_upgrade(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          _index = args.delete('index')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'GET'
          url     = Utils.build_url(_index, '_upgrade')

          Utils.validate_query_params! args, GET_UPGRADE_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        GET_UPGRADE_QUERY_PARAMS = Set.new(%w[
          allow_no_indices
          expand_wildcards
          ignore_unavailable
        ]).freeze
      end
    end
  end
end
