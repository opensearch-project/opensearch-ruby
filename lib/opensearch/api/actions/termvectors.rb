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
        # Returns information and statistics about terms in the fields of a particular document.
        #
        # @option args [String] :index *Required* Name of the index that contains the document.
        # @option args [Boolean] :field_statistics (default: true) If `true`, the response includes the document count, sum of document frequencies, and sum of total term frequencies.
        # @option args [Enumerable<String>, String] :fields Comma-separated list or wildcard expressions of fields to include in the statistics. Used as the default list unless a specific field list is provided in the `completion_fields` or `fielddata_fields` parameters.
        # @option args [Boolean] :offsets (default: true) If `true`, the response includes term offsets.
        # @option args [Boolean] :payloads (default: true) If `true`, the response includes term payloads.
        # @option args [Boolean] :positions (default: true) If `true`, the response includes term positions.
        # @option args [String] :preference (default: random) Specifies the node or shard the operation should be performed on. Random by default.
        # @option args [Boolean] :realtime (default: true) If `true`, the request is real-time as opposed to near-real-time.
        # @option args [Enumerable<String>, String] :routing Custom value used to route operations to a specific shard.
        # @option args [Boolean] :term_statistics If `true`, the response includes term frequency and document frequency.
        # @option args [Integer] :version If `true`, returns the document version as part of a hit.
        # @option args [String] :version_type Specific version type.
        # @option args [String] :id Unique identifier of the document.
        # @option args [Hash] :body Define parameters and or supply a document to get termvectors for. See documentation.
        def termvectors(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'index' missing" if args['index'].nil?

          _index = args.delete('index')
          _id = args.delete('id')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = body ? 'POST' : 'GET'
          url     = Utils.build_url(_index, '_termvectors', _id)

          Utils.validate_query_params! args, TERMVECTORS_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        TERMVECTORS_QUERY_PARAMS = Set.new(%w[
          field_statistics
          fields
          offsets
          payloads
          positions
          preference
          realtime
          routing
          term_statistics
          version
          version_type
        ]).freeze
      end
    end
  end
end
