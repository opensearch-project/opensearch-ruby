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
        # Allows to copy documents from one index to another, optionally filtering the source
        # documents by a query, changing the destination index settings, or fetching the
        # documents from a remote cluster.
        #
        # @option args [Integer] :max_docs Maximum number of documents to process. By default, all documents.
        # @option args [Boolean, String] :refresh If `true`, the request refreshes affected shards to make this operation visible to search.
        # @option args [Float] :requests_per_second (default: 0) The throttle for this request in sub-requests per second. Defaults to no throttle.
        # @option args [Boolean] :require_alias
        # @option args [String] :scroll Specifies how long a consistent view of the index should be maintained for scrolled search.
        # @option args [Integer, String] :slices The number of slices this task should be divided into. Defaults to 1 slice, meaning the task isn't sliced into subtasks.
        # @option args [String] :timeout Period each indexing waits for automatic index creation, dynamic mapping updates, and waiting for active shards.
        # @option args [Integer, NilClass, String] :wait_for_active_shards The number of shard copies that must be active before proceeding with the operation. Set to `all` or any positive integer up to the total number of shards in the index (`number_of_replicas+1`).
        # @option args [Boolean] :wait_for_completion (default: true) If `true`, the request blocks until the operation is complete.
        # @option args [Hash] :body *Required* The search definition using the Query DSL and the prototype for the index request.
        def reindex(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'body' missing" if args['body'].nil?

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'POST'
          url     = '_reindex'

          Utils.validate_query_params! args, REINDEX_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        REINDEX_QUERY_PARAMS = Set.new(%w[
          max_docs
          refresh
          requests_per_second
          require_alias
          scroll
          slices
          timeout
          wait_for_active_shards
          wait_for_completion
        ]).freeze
      end
    end
  end
end
