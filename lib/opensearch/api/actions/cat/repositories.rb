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
    module Cat
      module Actions
        # Returns information about all snapshot repositories for a cluster.
        #
        # @option args [String] :cluster_manager_timeout The amount of time allowed to establish a connection to the cluster manager node.
        # @option args [String] :format A short version of the `Accept` header, such as `json` or `yaml`.
        # @option args [Enumerable<String>] :h A comma-separated list of column names to display.
        # @option args [Boolean] :help Returns help information.
        # @option args [Boolean] :local Returns local information but does not retrieve the state from the cluster manager node.
        # @option args [String] :master_timeout DEPRECATED The amount of time allowed to establish a connection to the cluster manager node.
        # @option args [Enumerable<String>] :s A comma-separated list of column names or column aliases to sort by.
        # @option args [Boolean] :v Enables verbose mode, which displays column headers.
        def repositories(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'GET'
          url     = '_cat/repositories'

          Utils.validate_query_params! args, REPOSITORIES_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        REPOSITORIES_QUERY_PARAMS = Set.new(%w[
          cluster_manager_timeout
          format
          h
          help
          local
          master_timeout
          s
          v
        ]).freeze
      end
    end
  end
end
