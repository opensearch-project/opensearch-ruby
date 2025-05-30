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
        # Initiates the replication of an index from the leader cluster to the follower cluster.
        #
        # @option args [String] :index *Required* The name of the data stream, index, or index alias to perform bulk actions on.
        # @option args [Hash] :body *Required*
        def start(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'index' missing" if args['index'].nil?
          raise ArgumentError, "Required argument 'body' missing" if args['body'].nil?

          _index = args.delete('index')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'PUT'
          url     = Utils.build_url('_plugins/_replication', _index, '_start')

          Utils.validate_query_params! args
          transport.perform_request(method, url, args, body, headers).body
        end
      end
    end
  end
end
