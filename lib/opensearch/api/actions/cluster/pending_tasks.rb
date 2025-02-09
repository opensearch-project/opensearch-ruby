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
        # Returns a list of pending cluster-level tasks, such as index creation, mapping updates,
        # or new allocations.
        #
        # @option args [String] :cluster_manager_timeout A duration. Units can be `nanos`, `micros`, `ms` (milliseconds), `s` (seconds), `m` (minutes), `h` (hours) and `d` (days). Also accepts "0" without a unit and "-1" to indicate an unspecified value.
        # @option args [Boolean] :local When `true`, the request retrieves information from the local node only. When `false`, information is retrieved from the cluster manager node.
        # @option args [String] :master_timeout DEPRECATED A duration. Units can be `nanos`, `micros`, `ms` (milliseconds), `s` (seconds), `m` (minutes), `h` (hours) and `d` (days). Also accepts "0" without a unit and "-1" to indicate an unspecified value.
        def pending_tasks(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'GET'
          url     = '_cluster/pending_tasks'

          Utils.validate_query_params! args, PENDING_TASKS_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        PENDING_TASKS_QUERY_PARAMS = Set.new(%w[
          cluster_manager_timeout
          local
          master_timeout
        ]).freeze
      end
    end
  end
end
