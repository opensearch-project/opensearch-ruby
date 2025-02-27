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
        # Removes a document from the index.
        #
        # @option args [String] :id *Required* Unique identifier for the document.
        # @option args [String] :index *Required* Name of the target index.
        # @option args [Integer] :if_primary_term Only perform the operation if the document has this primary term.
        # @option args [Integer] :if_seq_no Only perform the operation if the document has this sequence number.
        # @option args [Boolean, String] :refresh If `true`, OpenSearch refreshes the affected shards to make this operation visible to search, if `wait_for` then wait for a refresh to make this operation visible to search, if `false` do nothing with refreshes. Valid values: `true`, `false`, `wait_for`.
        # @option args [Enumerable<String>, String] :routing Custom value used to route operations to a specific shard.
        # @option args [String] :timeout Period to wait for active shards.
        # @option args [Integer] :version Explicit version number for concurrency control. The specified version must match the current version of the document for the request to succeed.
        # @option args [String] :version_type Specific version type: `external`, `external_gte`.
        # @option args [Integer, String] :wait_for_active_shards The number of shard copies that must be active before proceeding with the operation. Set to `all` or any positive integer up to the total number of shards in the index (`number_of_replicas+1`).
        def delete(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'id' missing" if args['id'].nil?
          raise ArgumentError, "Required argument 'index' missing" if args['index'].nil?

          _id = args.delete('id')
          _index = args.delete('index')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'DELETE'
          url     = Utils.build_url(_index, '_doc', _id)

          Utils.validate_query_params! args, DELETE_QUERY_PARAMS
          transport.perform_delete_request method, url, args, body, headers
        end

        DELETE_QUERY_PARAMS = Set.new(%w[
          if_primary_term
          if_seq_no
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
