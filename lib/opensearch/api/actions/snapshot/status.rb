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
    module Snapshot
      module Actions
        # Returns information about the status of a snapshot.
        #
        # @option args [String] :cluster_manager_timeout Operation timeout for connection to cluster-manager node.
        # @option args [Boolean] :ignore_unavailable Whether to ignore unavailable snapshots, defaults to `false` which means a SnapshotMissingException is thrown
        # @option args [String] :master_timeout DEPRECATED Explicit operation timeout for connection to cluster-manager node
        # @option args [String] :repository A repository name
        # @option args [Enumerable<String>, String] :snapshot A comma-separated list of snapshot names
        def status(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          _repository = args.delete('repository')
          _snapshot = args.delete('snapshot')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'GET'
          url     = Utils.build_url('_snapshot', _repository, _snapshot, '_status')

          Utils.validate_query_params! args, STATUS_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        STATUS_QUERY_PARAMS = Set.new(%w[
          cluster_manager_timeout
          ignore_unavailable
          master_timeout
        ]).freeze
      end
    end
  end
end
