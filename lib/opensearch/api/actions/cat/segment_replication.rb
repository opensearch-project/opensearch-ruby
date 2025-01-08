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
    module Cat
      module Actions
        # Returns information about both on-going and latest completed Segment Replication events.
        #
        # @option args [Boolean] :active_only If `true`, the response only includes ongoing segment replication events.
        # @option args [Boolean] :allow_no_indices Whether to ignore if a wildcard indexes expression resolves into no concrete indexes. (This includes `_all` string or when no indexes have been specified).
        # @option args [String] :bytes The unit in which to display byte values.
        # @option args [Boolean] :completed_only If `true`, the response only includes latest completed segment replication events.
        # @option args [Boolean] :detailed If `true`, the response includes detailed information about segment replications.
        # @option args [Enumerable<String>, String] :expand_wildcards Whether to expand wildcard expression to concrete indexes that are open, closed or both.
        # @option args [String] :format A short version of the Accept header (for example, `json`, `yaml`).
        # @option args [Enumerable<String>] :h Comma-separated list of column names to display.
        # @option args [Boolean] :help Return help information.
        # @option args [Boolean] :ignore_throttled Whether specified concrete, expanded or aliased indexes should be ignored when throttled.
        # @option args [Boolean] :ignore_unavailable Whether specified concrete indexes should be ignored when unavailable (missing or closed).
        # @option args [Enumerable<String>] :index Comma-separated list or wildcard expression of index names to limit the returned information.
        # @option args [Enumerable<String>] :s Comma-separated list of column names or column aliases to sort by.
        # @option args [Enumerable<String>] :shards Comma-separated list of shards to display.
        # @option args [String] :time The unit in which to display time values.
        # @option args [String] :timeout Operation timeout.
        # @option args [Boolean] :v Verbose mode. Display column headers.
        def segment_replication(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          _index = args.delete('index')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'GET'
          url     = Utils.build_url('_cat/segment_replication', _index)

          Utils.validate_query_params! args, SEGMENT_REPLICATION_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        SEGMENT_REPLICATION_QUERY_PARAMS = Set.new(%w[
          active_only
          allow_no_indices
          bytes
          completed_only
          detailed
          expand_wildcards
          format
          h
          help
          ignore_throttled
          ignore_unavailable
          s
          shards
          time
          timeout
          v
        ]).freeze
      end
    end
  end
end
