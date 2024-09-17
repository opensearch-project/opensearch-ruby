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
        # Updates the cluster settings.
        #
        # @option args [String] :cluster_manager_timeout Operation timeout for connection to cluster-manager node.
        # @option args [Boolean] :flat_settings Return settings in flat format.
        # @option args [String] :master_timeout DEPRECATED Explicit operation timeout for connection to cluster-manager node
        # @option args [String] :timeout Explicit operation timeout
        # @option args [Hash] :body *Required* The settings to be updated. Can be either `transient` or `persistent` (survives cluster restart).
        def put_settings(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'body' missing" if args['body'].nil?

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'PUT'
          url     = '_cluster/settings'

          Utils.validate_query_params! args, PUT_SETTINGS_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        PUT_SETTINGS_QUERY_PARAMS = Set.new(%w[
          cluster_manager_timeout
          flat_settings
          master_timeout
          timeout
        ]).freeze
      end
    end
  end
end
