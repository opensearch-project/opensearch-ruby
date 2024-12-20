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
        # Returns a document.
        #
        # @option args [String] :id *Required* Unique identifier of the document.
        # @option args [String] :index *Required* Name of the index that contains the document.
        # @option args [Boolean, Enumerable<String>, String] :_source Set to `true` or `false` to return the `_source` field or not, or a list of fields to return.
        # @option args [Enumerable<String>, String] :_source_excludes A comma-separated list of source fields to exclude in the response.
        # @option args [Enumerable<String>, String] :_source_includes A comma-separated list of source fields to include in the response.
        # @option args [String] :preference (default: random) Specifies the node or shard the operation should be performed on. Random by default.
        # @option args [Boolean] :realtime If `true`, the request is real-time as opposed to near-real-time.
        # @option args [Boolean, String] :refresh If `true`, OpenSearch refreshes the affected shards to make this operation visible to search. If `false`, do nothing with refreshes.
        # @option args [Enumerable<String>, String] :routing Target the specified primary shard.
        # @option args [Enumerable<String>, String] :stored_fields List of stored fields to return as part of a hit. If no fields are specified, no stored fields are included in the response. If this field is specified, the `_source` parameter defaults to false.
        # @option args [Integer] :version Explicit version number for concurrency control. The specified version must match the current version of the document for the request to succeed.
        # @option args [String] :version_type Specific version type: `internal`, `external`, `external_gte`.
        def get(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'id' missing" if args['id'].nil?
          raise ArgumentError, "Required argument 'index' missing" if args['index'].nil?

          _id = args.delete('id')
          _index = args.delete('index')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'GET'
          url     = Utils.build_url(_index, '_doc', _id)

          Utils.validate_query_params! args, GET_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        GET_QUERY_PARAMS = Set.new(%w[
          _source
          _source_excludes
          _source_includes
          preference
          realtime
          refresh
          routing
          stored_fields
          version
          version_type
        ]).freeze
      end
    end
  end
end
