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
        # Performs the force merge operation on one or more indexes.
        #
        # @option args [Boolean] :allow_no_indices Whether to ignore if a wildcard indexes expression resolves into no concrete indexes. (This includes `_all` string or when no indexes have been specified)
        # @option args [Enumerable<String>, String] :expand_wildcards Whether to expand wildcard expression to concrete indexes that are open, closed or both.
        # @option args [Boolean] :flush (default: true) Specify whether the index should be flushed after performing the operation.
        # @option args [Boolean] :ignore_unavailable Whether specified concrete indexes should be ignored when unavailable (missing or closed)
        # @option args [Float] :max_num_segments The number of larger segments into which smaller segments are merged. Set this parameter to 1 to merge all segments into one segment. The default behavior is to perform the merge as necessary.
        # @option args [Boolean] :only_expunge_deletes Specify whether the operation should only expunge deleted documents
        # @option args [Boolean] :primary_only Specify whether the operation should only perform on primary shards. Defaults to false.
        # @option args [Boolean] :wait_for_completion (default: true) Should the request wait until the force merge is completed.
        # @option args [Enumerable<String>, String] :index A comma-separated list of index names; use `_all` or empty string to perform the operation on all indexes
        def forcemerge(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          _index = args.delete('index')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'POST'
          url     = Utils.build_url(_index, '_forcemerge')

          Utils.validate_query_params! args, FORCEMERGE_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        FORCEMERGE_QUERY_PARAMS = Set.new(%w[
          allow_no_indices
          expand_wildcards
          flush
          ignore_unavailable
          max_num_segments
          only_expunge_deletes
          primary_only
          wait_for_completion
        ]).freeze
      end
    end
  end
end
