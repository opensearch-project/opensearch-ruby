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
        # Imports the specified dangling index.
        #
        # @option args [String] :index_uuid *Required* The UUID of the dangling index.
        # @option args [Boolean] :accept_data_loss *Required* Must be set to true in order to import the dangling index.
        # @option args [String] :cluster_manager_timeout Operation timeout for connection to cluster-manager node.
        # @option args [String] :master_timeout DEPRECATED Specify timeout for connection to cluster manager.
        # @option args [String] :timeout Explicit operation timeout.
        def import_dangling_index(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'index_uuid' missing" if args['index_uuid'].nil?
          raise ArgumentError, "Required argument 'accept_data_loss' missing" if args['accept_data_loss'].nil?

          _index_uuid = args.delete('index_uuid')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'POST'
          url     = Utils.build_url('_dangling', _index_uuid)

          Utils.validate_query_params! args, IMPORT_DANGLING_INDEX_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        IMPORT_DANGLING_INDEX_QUERY_PARAMS = Set.new(%w[
          accept_data_loss
          cluster_manager_timeout
          master_timeout
          timeout
        ]).freeze
      end
    end
  end
end
