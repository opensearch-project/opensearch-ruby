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
        # Returns a comprehensive information about the state of the cluster.
        #
        # @option args [Boolean] :allow_no_indices Whether to ignore if a wildcard indexes expression resolves into no concrete indexes. (This includes `_all` string or when no indexes have been specified)
        # @option args [String] :cluster_manager_timeout Operation timeout for connection to cluster-manager node.
        # @option args [Enumerable<String>, String] :expand_wildcards Whether to expand wildcard expression to concrete indexes that are open, closed or both.
        # @option args [Boolean] :flat_settings Return settings in flat format.
        # @option args [Boolean] :ignore_unavailable Whether specified concrete indexes should be ignored when unavailable (missing or closed)
        # @option args [Boolean] :local Return local information, do not retrieve the state from cluster-manager node.
        # @option args [String] :master_timeout DEPRECATED Specify timeout for connection to cluster manager.
        # @option args [Integer] :wait_for_metadata_version Wait for the metadata version to be equal or greater than the specified metadata version.
        # @option args [String] :wait_for_timeout The maximum time to wait for `wait_for_metadata_version` before timing out.
        # @option args [Enumerable<String>] :metric Limit the information returned to the specified metrics
        # @option args [Enumerable<String>, String] :index A comma-separated list of index names; use `_all` or empty string to perform the operation on all indexes
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
