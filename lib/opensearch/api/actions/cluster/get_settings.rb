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
        # Returns cluster settings.
        #
        # @option args [String] :cluster_manager_timeout Operation timeout for connection to cluster-manager node.
        # @option args [Boolean] :flat_settings If `true`, returns settings in flat format.
        # @option args [Boolean] :include_defaults If `true`, returns default cluster settings from the local node.
        # @option args [String] :master_timeout DEPRECATED Period to wait for a connection to the cluster-manager node. If no response is received before the timeout expires, the request fails and returns an error.
        # @option args [String] :timeout Period to wait for a response. If no response is received before the timeout expires, the request fails and returns an error.
        def get_settings(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'GET'
          url     = '_cluster/settings'

          Utils.validate_query_params! args, GET_SETTINGS_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        GET_SETTINGS_QUERY_PARAMS = Set.new(%w[
          cluster_manager_timeout
          flat_settings
          include_defaults
          master_timeout
          timeout
        ]).freeze
      end
    end
  end
end
