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
        # Updates a document with a script or partial document.
        #
        # @option args [String] :id *Required* Document ID
        # @option args [String] :index *Required* The name of the index
        # @option args [Boolean, Enumerable<String>, String] :_source Set to `false` to disable source retrieval. You can also specify a comma-separated list of the fields you want to retrieve.
        # @option args [Enumerable<String>, String] :_source_excludes Specify the source fields you want to exclude.
        # @option args [Enumerable<String>, String] :_source_includes Specify the source fields you want to retrieve.
        # @option args [Integer] :if_primary_term Only perform the operation if the document has this primary term.
        # @option args [Integer] :if_seq_no Only perform the operation if the document has this sequence number.
        # @option args [String] :lang (default: painless) The script language.
        # @option args [Boolean, String] :refresh If 'true', OpenSearch refreshes the affected shards to make this operation visible to search, if `wait_for` then wait for a refresh to make this operation visible to search, if `false` do nothing with refreshes.
        # @option args [Boolean] :require_alias If `true`, the destination must be an index alias.
        # @option args [Integer] :retry_on_conflict (default: 0) Specify how many times should the operation be retried when a conflict occurs.
        # @option args [Enumerable<String>, String] :routing Custom value used to route operations to a specific shard.
        # @option args [String] :timeout Period to wait for dynamic mapping updates and active shards. This guarantees OpenSearch waits for at least the timeout before failing. The actual wait time could be longer, particularly when multiple waits occur.
        # @option args [Integer, String] :wait_for_active_shards The number of shard copies that must be active before proceeding with the operations. Set to 'all' or any positive integer up to the total number of shards in the index (number_of_replicas+1). Defaults to 1 meaning the primary shard.
        # @option args [Hash] :body *Required* The request definition requires either `script` or partial `doc`
        def update(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'id' missing" if args['id'].nil?
          raise ArgumentError, "Required argument 'index' missing" if args['index'].nil?
          raise ArgumentError, "Required argument 'body' missing" if args['body'].nil?

          _id = args.delete('id')
          _index = args.delete('index')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'POST'
          url     = Utils.build_url(_index, '_update', _id)

          Utils.validate_query_params! args, UPDATE_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        UPDATE_QUERY_PARAMS = Set.new(%w[
          _source
          _source_excludes
          _source_includes
          if_primary_term
          if_seq_no
          lang
          refresh
          require_alias
          retry_on_conflict
          routing
          timeout
          wait_for_active_shards
        ]).freeze
      end
    end
  end
end
