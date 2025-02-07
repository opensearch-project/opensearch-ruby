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
    module Ml
      module Actions
        # Get all memories.
        #
        # @option args [Integer] :max_results The maximum number of results to return. If there are fewer memories than the number set in `max_results`, the response returns only the number of memories that exist. Default is `10`.
        # @option args [Integer] :next_token The index of the first memory in the sorted list of memories to return. Memories are ordered by `create_time`. For example, if memories `A`, `B`, and `C` exist, `next_token=1` returns memories `B` and `C`. Default is `0` (return all memories).
        def get_all_memories(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'GET'
          url     = '_plugins/_ml/memory'

          Utils.validate_query_params! args, GET_ALL_MEMORIES_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        GET_ALL_MEMORIES_QUERY_PARAMS = Set.new(%w[
          max_results
          next_token
        ]).freeze
      end
    end
  end
end
