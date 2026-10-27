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
        # Delete multiple memories using a query to match specific criteria.
        #
        # @option args [String] :memory_container_id *Required*
        # @option args [String] :type *Required*
        # @option args [Hash] :body
        def delete_agentic_memory_query(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'memory_container_id' missing" if args['memory_container_id'].nil?
          raise ArgumentError, "Required argument 'type' missing" if args['type'].nil?

          _memory_container_id = args.delete('memory_container_id')
          _type = args.delete('type')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'POST'
          url     = Utils.build_url('_plugins/_ml/memory_containers', _memory_container_id, 'memories', _type, '_delete_by_query')

          Utils.validate_query_params! args
          transport.perform_request(method, url, args, body, headers).body
        end
      end
    end
  end
end
