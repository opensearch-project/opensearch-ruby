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
    module Indices
      module Actions
        # Provides statistics on operations happening in an index.
        #
        # @option args [Enumerable<String>, String] :completion_fields A comma-separated list or wildcard expressions of fields to include in field data and suggest statistics.
        # @option args [Enumerable<String>, String] :expand_wildcards Type of index that wildcard patterns can match. If the request can target data streams, this argument determines whether wildcard expressions match hidden data streams. Supports comma-separated values, such as `open,hidden`.
        # @option args [Enumerable<String>, String] :fielddata_fields A comma-separated list or wildcard expressions of fields to include in field data statistics.
        # @option args [Enumerable<String>, String] :fields A comma-separated list or wildcard expressions of fields to include in the statistics.
        # @option args [Boolean] :forbid_closed_indices (default: true) If `true`, statistics are not collected from closed indexes.
        # @option args [Enumerable<String>, String] :groups A comma-separated list of search groups to include in the search statistics.
        # @option args [Boolean] :include_segment_file_sizes If `true`, the call reports the aggregated disk usage of each one of the Lucene index files (only applies if segment stats are requested).
        # @option args [Boolean] :include_unloaded_segments If `true`, the response includes information from segments that are not loaded into memory.
        # @option args [String] :level Indicates whether statistics are aggregated at the cluster, index, or shard level.
        # @option args [Enumerable<String>, String] :metric Limit the information returned the specific metrics.
        # @option args [Enumerable<String>, String] :index A comma-separated list of index names; use `_all` or empty string to perform the operation on all indexes
        def stats(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          _metric = args.delete('metric')
          _index = args.delete('index')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'GET'
          url     = Utils.build_url(_index, '_stats', _metric)

          Utils.validate_query_params! args, STATS_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        STATS_QUERY_PARAMS = Set.new(%w[
          completion_fields
          expand_wildcards
          fielddata_fields
          fields
          forbid_closed_indices
          groups
          include_segment_file_sizes
          include_unloaded_segments
          level
        ]).freeze
      end
    end
  end
end
