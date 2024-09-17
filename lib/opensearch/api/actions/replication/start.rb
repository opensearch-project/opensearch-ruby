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
    module Replication
      module Actions
        # Initiate replication of an index from the leader cluster to the follower cluster.
        #
        # @option args [String] :index *Required* Name of the data stream, index, or index alias to perform bulk actions on.
        # @option args [Hash] :body *Required*
        def start(args = {})
          args = Utils.normalize_arguments(args)
          raise ArgumentError, "Required argument 'index' missing" unless args['index']
          raise ArgumentError, "Required argument 'body' missing" unless args['body']

          _index = args.delete('index')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'PUT'
          url     = ['_plugins/_replication', _index, '_start'].filter(&:present?).join('/').squeeze('/')

          Utils.validate_query_params args
          transport.perform_request(method, url, args, body, headers).body
        end
      end
    end
  end
end
