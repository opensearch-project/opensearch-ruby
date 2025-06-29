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
        # Allows to get multiple documents in one request.
        #
        # @option args [Boolean, Enumerable<String>, String] :_source Set to `true` or `false` to return the `_source` field or not, or a list of fields to return.
        # @option args [Enumerable<String>, String] :_source_excludes A comma-separated list of source fields to exclude from the response. You can also use this parameter to exclude fields from the subset specified in `_source_includes` query parameter.
        # @option args [Enumerable<String>, String] :_source_includes A comma-separated list of source fields to include in the response. If this parameter is specified, only these source fields are returned. You can exclude fields from this subset using the `_source_excludes` query parameter. If the `_source` parameter is `false`, this parameter is ignored.
        # @option args [String] :preference (default: random) Specifies the node or shard the operation should be performed on. Random by default.
        # @option args [Boolean] :realtime If `true`, the request is real time as opposed to near real time.
        # @option args [Boolean, String] :refresh If `true`, the request refreshes relevant shards before retrieving documents.
        # @option args [Enumerable<String>, String] :routing A custom value used to route operations to a specific shard.
        # @option args [Enumerable<String>, String] :stored_fields If `true`, retrieves the document fields stored in the index rather than the document `_source`.
        # @option args [String] :index The name of the index to retrieve documents from when `ids` are specified, or when a document in the `docs` array does not specify an index.
        # @option args [Hash] :body *Required* Document identifiers; can be either `docs` (containing full document information) or `ids` (when index is provided in the URL.
        def mget(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'body' missing" if args['body'].nil?

          _index = args.delete('index')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = body ? 'POST' : 'GET'
          url     = Utils.build_url(_index, '_mget')

          Utils.validate_query_params! args, MGET_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        MGET_QUERY_PARAMS = Set.new(%w[
          _source
          _source_excludes
          _source_includes
          preference
          realtime
          refresh
          routing
          stored_fields
        ]).freeze
      end
    end
  end
end
