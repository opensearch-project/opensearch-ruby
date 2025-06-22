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
        # Creates a new document in the index.
        # Returns a 409 response when a document with a same ID already exists in the index.
        #
        # @option args [String] :id *Required* The unique identifier for the document.
        # @option args [String] :index *Required* Name of the data stream or index to target. If the target doesn't exist and matches the name or wildcard (`*`) pattern of an index template with a `data_stream` definition, this request creates the data stream. If the target doesn't exist and doesn't match a data stream template, this request creates the index.
        # @option args [String] :pipeline ID of the pipeline to use to preprocess incoming documents. If the index has a default ingest pipeline specified, then setting the value to `_none` disables the default ingest pipeline for this request. If a final pipeline is configured it will always run, regardless of the value of this parameter.
        # @option args [Boolean, String] :refresh If `true`, OpenSearch refreshes the affected shards to make this operation visible to search, if `wait_for` then wait for a refresh to make this operation visible to search, if `false` do nothing with refreshes. Valid values: `true`, `false`, `wait_for`.
        # @option args [Enumerable<String>, String] :routing A custom value used to route operations to a specific shard.
        # @option args [String] :timeout Period the request waits for the following operations: automatic index creation, dynamic mapping updates, waiting for active shards.
        # @option args [Integer] :version Explicit version number for concurrency control. The specified version must match the current version of the document for the request to succeed.
        # @option args [String] :version_type The specific version type: `external`, `external_gte`.
        # @option args [Integer, String, NilClass, String] :wait_for_active_shards The number of shard copies that must be active before proceeding with the operation. Set to `all` or any positive integer up to the total number of shards in the index (`number_of_replicas+1`).
        # @option args [Hash] :body *Required* The document
        def create(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'id' missing" if args['id'].nil?
          raise ArgumentError, "Required argument 'index' missing" if args['index'].nil?
          raise ArgumentError, "Required argument 'body' missing" if args['body'].nil?

          _id = args.delete('id')
          _index = args.delete('index')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'POST'
          url     = Utils.build_url(_index, '_create', _id)

          Utils.validate_query_params! args, CREATE_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        CREATE_QUERY_PARAMS = Set.new(%w[
          pipeline
          refresh
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
