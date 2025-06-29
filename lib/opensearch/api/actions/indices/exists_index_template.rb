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
    module Indices
      module Actions
        # Returns information about whether a particular index template exists.
        #
        # @option args [String] :name *Required* The name of the index template to check existence of. Wildcard (*) expressions are supported.
        # @option args [String] :cluster_manager_timeout Operation timeout for connection to cluster-manager node.
        # @option args [Boolean] :flat_settings Return settings in flat format.
        # @option args [Boolean] :local Return local information, do not retrieve the state from cluster-manager node.
        # @option args [String] :master_timeout DEPRECATED Period to wait for a connection to the cluster-manager node. If no response is received before the timeout expires, the request fails and returns an error.
        def exists_index_template(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'name' missing" if args['name'].nil?

          _name = args.delete('name')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'HEAD'
          url     = Utils.build_url('_index_template', _name)

          Utils.validate_query_params! args, EXISTS_INDEX_TEMPLATE_QUERY_PARAMS
          transport.perform_head_request method, url, args, body, headers
        end

        EXISTS_INDEX_TEMPLATE_QUERY_PARAMS = Set.new(%w[
          cluster_manager_timeout
          flat_settings
          local
          master_timeout
        ]).freeze
      end
    end
  end
end
