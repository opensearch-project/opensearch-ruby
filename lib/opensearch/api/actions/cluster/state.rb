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
    module Cluster
      module Actions
        # Returns comprehensive information about the state of the cluster.
        #
        # @option args [Boolean] :allow_no_indices Whether to ignore a wildcard index expression that resolves into no concrete indexes. This includes the `_all` string or when no indexes have been specified.
        # @option args [String] :cluster_manager_timeout The amount of time to wait for a response from the cluster manager node. For more information about supported time units, see [Common parameters](https://opensearch.org/docs/latest/api-reference/common-parameters/#time-units).
        # @option args [Enumerable<String>, String] :expand_wildcards Specifies the type of index that wildcard expressions can match. Supports comma-separated values.
        # @option args [Boolean] :flat_settings Returns settings in a flat format.
        # @option args [Boolean] :ignore_unavailable Whether the specified concrete indexes should be ignored when unavailable (missing or closed).
        # @option args [Boolean] :local Whether to return information from the local node only instead of from the cluster manager node.
        # @option args [String] :master_timeout DEPRECATED A duration. Units can be `nanos`, `micros`, `ms` (milliseconds), `s` (seconds), `m` (minutes), `h` (hours) and `d` (days). Also accepts "0" without a unit and "-1" to indicate an unspecified value.
        # @option args [Integer] :wait_for_metadata_version Wait for the metadata version to be equal or greater than the specified metadata version.
        # @option args [String] :wait_for_timeout The maximum time to wait for `wait_for_metadata_version` before timing out.
        # @option args [Enumerable<String>] :metric Limits the information returned to only the specified metrics.
        # @option args [Enumerable<String>, String] :index A comma-separated list of data streams, indexes, and aliases used to limit the request. Supports wildcards (`*`). To target all data streams and indexes, omit this parameter or use `*` or `_all`.
        def state(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          _metric = args.delete('metric')
          _index = args.delete('index')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'GET'
          url     = Utils.build_url('_cluster/state', _metric, _index)

          Utils.validate_query_params! args, STATE_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        STATE_QUERY_PARAMS = Set.new(%w[
          allow_no_indices
          cluster_manager_timeout
          expand_wildcards
          flat_settings
          ignore_unavailable
          local
          master_timeout
          wait_for_metadata_version
          wait_for_timeout
        ]).freeze
      end
    end
  end
end
