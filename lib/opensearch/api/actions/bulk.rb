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
        # Allows to perform multiple index/update/delete operations in a single request.
        #
        # @option args [Boolean, Enumerable<String>, String] :_source `true` or `false` to return the `_source` field or not, or a list of fields to return.
        # @option args [Enumerable<String>, String] :_source_excludes A comma-separated list of source fields to exclude from the response.
        # @option args [Enumerable<String>, String] :_source_includes A comma-separated list of source fields to include in the response.
        # @option args [String] :pipeline ID of the pipeline to use to preprocess incoming documents. If the index has a default ingest pipeline specified, then setting the value to `_none` disables the default ingest pipeline for this request. If a final pipeline is configured it will always run, regardless of the value of this parameter.
        # @option args [Boolean, String] :refresh If `true`, OpenSearch refreshes the affected shards to make this operation visible to search, if `wait_for` then wait for a refresh to make this operation visible to search, if `false` do nothing with refreshes. Valid values: `true`, `false`, `wait_for`.
        # @option args [Boolean] :require_alias If `true`, the request's actions must target an index alias.
        # @option args [String] :routing A custom value used to route operations to a specific shard.
        # @option args [String] :timeout Period each action waits for the following operations: automatic index creation, dynamic mapping updates, waiting for active shards.
        # @option args [String] :type Default document type for items which don't provide one.
        # @option args [Integer, String, NilClass, String] :wait_for_active_shards The number of shard copies that must be active before proceeding with the operation. Set to all or any positive integer up to the total number of shards in the index (`number_of_replicas+1`).
        # @option args [String] :index Name of the data stream, index, or index alias to perform bulk actions on.
        # @option args [Enumerable<Hash>] :body *Required* The operation definition and data (action-data pairs), separated by newlines
        def bulk(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'body' missing" if args['body'].nil?

          _index = args.delete('index')

          headers = (args.delete('headers') || {}).merge('Content-Type' => 'application/x-ndjson')
          body    = Utils.bulkify(args.delete('body'))
          method  = _index.nil? ? 'POST' : 'PUT'
          url     = Utils.build_url(_index, '_bulk')

          Utils.validate_query_params! args, BULK_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        BULK_QUERY_PARAMS = Set.new(%w[
          _source
          _source_excludes
          _source_includes
          pipeline
          refresh
          require_alias
          routing
          timeout
          type
          wait_for_active_shards
        ]).freeze
      end
    end
  end
end
