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
        # Creates or updates a document in an index.
        #
        # @option args [String] :index *Required* Name of the data stream or index to target.
        # @option args [Integer] :if_primary_term Only perform the operation if the document has this primary term.
        # @option args [Integer] :if_seq_no Only perform the operation if the document has this sequence number.
        # @option args [String] :op_type Set to create to only index the document if it does not already exist (put if absent). If a document with the specified `_id` already exists, the indexing operation will fail. Same as using the `<index>/_create` endpoint. Valid values: `index`, `create`. If document id is specified, it defaults to `index`. Otherwise, it defaults to `create`.
        # @option args [String] :pipeline ID of the pipeline to use to preprocess incoming documents. If the index has a default ingest pipeline specified, then setting the value to `_none` disables the default ingest pipeline for this request. If a final pipeline is configured it will always run, regardless of the value of this parameter.
        # @option args [Boolean, String] :refresh If `true`, OpenSearch refreshes the affected shards to make this operation visible to search, if `wait_for` then wait for a refresh to make this operation visible to search, if `false` do nothing with refreshes. Valid values: `true`, `false`, `wait_for`.
        # @option args [Boolean] :require_alias If `true`, the destination must be an index alias.
        # @option args [Enumerable<String>, String] :routing Custom value used to route operations to a specific shard.
        # @option args [String] :timeout Period the request waits for the following operations: automatic index creation, dynamic mapping updates, waiting for active shards.
        # @option args [Integer] :version Explicit version number for concurrency control. The specified version must match the current version of the document for the request to succeed.
        # @option args [String] :version_type Specific version type: `external`, `external_gte`.
        # @option args [Integer, NilClass, String] :wait_for_active_shards The number of shard copies that must be active before proceeding with the operation. Set to all or any positive integer up to the total number of shards in the index (`number_of_replicas+1`).
        # @option args [String] :id Unique identifier for the document.
        # @option args [Hash] :body *Required* The document
        def index(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'index' missing" if args['index'].nil?
          raise ArgumentError, "Required argument 'body' missing" if args['body'].nil?

          _index = args.delete('index')
          _id = args.delete('id')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = _id.nil? ? 'POST' : 'PUT'
          url     = Utils.build_url(_index, '_doc', _id)

          Utils.validate_query_params! args, INDEX_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        INDEX_QUERY_PARAMS = Set.new(%w[
          if_primary_term
          if_seq_no
          op_type
          pipeline
          refresh
          require_alias
          routing
          timeout
          version
          version_type
          wait_for_active_shards
        ]).freeze
      end
    end
  end
end
