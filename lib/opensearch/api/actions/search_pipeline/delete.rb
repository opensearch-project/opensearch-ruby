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
    module SearchPipeline
      module Actions
        # Deletes the specified search pipeline.
        #
        # @option args [String] :id *Required* Pipeline ID.
        # @option args [String] :cluster_manager_timeout Operation timeout for connection to cluster-manager node.
        # @option args [String] :timeout Operation timeout.
        # @option args [List] :ignore set to [404] to ignore server's NOT FOUND error for this request
        def delete(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'id' missing" if args['id'].nil?

          _id = args.delete('id')

          ignore  = args.delete('ignore') || []
          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'DELETE'
          url     = Utils.build_url('_search/pipeline', _id)

          Utils.validate_query_params! args, DELETE_QUERY_PARAMS
          transport.perform_delete_request method, url, args, body, headers, ignore.include?(404)
        end

        DELETE_QUERY_PARAMS = Set.new(%w[
          cluster_manager_timeout
          timeout
        ]).freeze
      end
    end
  end
end
