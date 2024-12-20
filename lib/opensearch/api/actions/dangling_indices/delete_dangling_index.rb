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
    module DanglingIndices
      module Actions
        # Deletes the specified dangling index.
        #
        # @option args [String] :index_uuid *Required* The UUID of the dangling index.
        # @option args [Boolean] :accept_data_loss *Required* Must be set to true in order to delete the dangling index.
        # @option args [String] :cluster_manager_timeout Operation timeout for connection to cluster-manager node.
        # @option args [String] :master_timeout DEPRECATED Specify timeout for connection to cluster manager.
        # @option args [String] :timeout Explicit operation timeout.
        # @option args [List] :ignore set to [404] to ignore server's NOT FOUND error for this request
        def delete_dangling_index(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'index_uuid' missing" if args['index_uuid'].nil?
          raise ArgumentError, "Required argument 'accept_data_loss' missing" if args['accept_data_loss'].nil?

          _index_uuid = args.delete('index_uuid')

          ignore  = args.delete('ignore') || []
          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'DELETE'
          url     = Utils.build_url('_dangling', _index_uuid)

          Utils.validate_query_params! args, DELETE_DANGLING_INDEX_QUERY_PARAMS
          transport.perform_delete_request method, url, args, body, headers, ignore.include?(404)
        end

        DELETE_DANGLING_INDEX_QUERY_PARAMS = Set.new(%w[
          accept_data_loss
          cluster_manager_timeout
          master_timeout
          timeout
        ]).freeze
      end
    end
  end
end
