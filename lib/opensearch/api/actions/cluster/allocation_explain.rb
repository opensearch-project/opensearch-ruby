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
        # Provides explanations for shard allocations in the cluster.
        #
        # @option args [Boolean] :include_disk_info If `true`, returns information about disk usage and shard sizes.
        # @option args [Boolean] :include_yes_decisions If `true`, returns YES decisions in explanation.
        # @option args [Hash] :body The index, shard, and primary flag to explain. Empty means 'explain the first unassigned shard'
        def allocation_explain(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = body ? 'POST' : 'GET'
          url     = '_cluster/allocation/explain'

          Utils.validate_query_params! args, ALLOCATION_EXPLAIN_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        ALLOCATION_EXPLAIN_QUERY_PARAMS = Set.new(%w[
          include_disk_info
          include_yes_decisions
        ]).freeze
      end
    end
  end
end
