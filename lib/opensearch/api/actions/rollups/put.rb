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
    module Rollups
      module Actions
        # Creates or updates an index rollup job configuration.
        #
        # @option args [String] :id *Required* The ID of the rollup job.
        # @option args [Float] :if_primary_term Only performs the operation if the document has the specified primary term.
        # @option args [Integer] :if_seq_no Only performs the operation if the document has the specified sequence number.
        # @option args [Hash] :body Updates the rollup job configuration.
        def put(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'id' missing" if args['id'].nil?

          _id = args.delete('id')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'PUT'
          url     = Utils.build_url('_plugins/_rollup/jobs', _id)

          Utils.validate_query_params! args, PUT_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        PUT_QUERY_PARAMS = Set.new(%w[
          if_primary_term
          if_seq_no
        ]).freeze
      end
    end
  end
end
