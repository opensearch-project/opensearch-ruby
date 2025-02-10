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
    module Ml
      module Actions
        # Get a message traces.
        #
        # @option args [String] :message_id *Required*
        # @option args [Integer] :max_results
        # @option args [Integer] :next_token
        def get_message_traces(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'message_id' missing" if args['message_id'].nil?

          _message_id = args.delete('message_id')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'GET'
          url     = Utils.build_url('_plugins/_ml/memory/message', _message_id, 'traces')

          Utils.validate_query_params! args, GET_MESSAGE_TRACES_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        GET_MESSAGE_TRACES_QUERY_PARAMS = Set.new(%w[
          max_results
          next_token
        ]).freeze
      end
    end
  end
end
