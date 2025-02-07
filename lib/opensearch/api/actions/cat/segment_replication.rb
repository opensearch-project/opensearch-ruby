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
        # Returns information about active and last-completed segment replication events on each replica shard, including related shard-level metrics.
        # These metrics provide information about how far behind the primary shard the replicas are lagging.
        #
        # @option args [Boolean] :active_only When `true`, the response only includes ongoing segment replication events.
        # @option args [Boolean] :allow_no_indices Whether to ignore the index if a wildcard index expression resolves to no concrete indexes. This includes the `_all` string or when no indexes have been specified.
        # @option args [String] :bytes The units used to display byte values.
        # @option args [Boolean] :completed_only When `true`, the response only includes the last-completed segment replication events.
        # @option args [Boolean] :detailed When `true`, the response includes additional metrics for each stage of a segment replication event.
        # @option args [Enumerable<String>, String] :expand_wildcards Specifies the type of index that wildcard expressions can match. Supports comma-separated values.
        # @option args [String] :format A short version of the `Accept` header, such as `json` or `yaml`.
        # @option args [Enumerable<String>] :h A comma-separated list of column names to display.
        # @option args [Boolean] :help Returns help information.
        # @option args [Boolean] :ignore_throttled Whether specified concrete, expanded, or aliased indexes should be ignored when throttled.
        # @option args [Boolean] :ignore_unavailable Whether the specified concrete indexes should be ignored when missing or closed.
        # @option args [Enumerable<String>] :index A comma-separated list of data streams, indexes, and aliases used to limit the request. Supports wildcards (`*`). To target all data streams and indexes, omit this parameter or use `*` or `_all`.
        # @option args [Enumerable<String>] :s A comma-separated list of column names or column aliases to sort by.
        # @option args [Enumerable<String>] :shards A comma-separated list of shards to display.
        # @option args [String] :time Specifies the time units, for example, `5d` or `7h`. For more information, see [Supported units](https://opensearch.org/docs/latest/api-reference/units/).
        # @option args [String] :timeout The operation timeout.
        # @option args [Boolean] :v Enables verbose mode, which displays column headers.
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
