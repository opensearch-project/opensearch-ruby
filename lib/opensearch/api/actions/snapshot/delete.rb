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
        # Deletes a snapshot.
        #
        # @option args [String] :repository *Required* A repository name
        # @option args [String] :snapshot *Required* A comma-separated list of snapshot names
        # @option args [String] :cluster_manager_timeout Operation timeout for connection to cluster-manager node.
        # @option args [String] :master_timeout DEPRECATED Explicit operation timeout for connection to cluster-manager node
        # @option args [List] :ignore set to [404] to ignore server's NOT FOUND error for this request
        def delete(args = {})
          args = Utils.normalize_arguments(args)
          raise ArgumentError, "Required argument 'repository' missing" unless args['repository']
          raise ArgumentError, "Required argument 'snapshot' missing" unless args['snapshot']

          _repository = args.delete('repository')
          _snapshot = args.delete('snapshot')

          ignore  = args.delete('ignore') || []
          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'DELETE'
          url     = ['_snapshot', _repository, _snapshot].filter(&:present?).join('/').squeeze('/')

          Utils.validate_query_params args, DELETE_QUERY_PARAMS
          transport.perform_delete_request method, url, args, body, headers, ignore.include?(404)
        end

        DELETE_QUERY_PARAMS = Set.new(%w[
          cluster_manager_timeout
          master_timeout
        ]).freeze
      end
    end
  end
end
