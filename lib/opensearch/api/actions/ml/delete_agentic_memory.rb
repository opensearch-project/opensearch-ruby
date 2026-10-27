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
        # Delete a specific memory by its type and ID.
        #
        # @option args [String] :id *Required*
        # @option args [String] :memory_container_id *Required*
        # @option args [String] :type *Required*
        def delete_agentic_memory(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'id' missing" if args['id'].nil?
          raise ArgumentError, "Required argument 'memory_container_id' missing" if args['memory_container_id'].nil?
          raise ArgumentError, "Required argument 'type' missing" if args['type'].nil?

          _id = args.delete('id')
          _memory_container_id = args.delete('memory_container_id')
          _type = args.delete('type')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'DELETE'
          url     = Utils.build_url('_plugins/_ml/memory_containers', _memory_container_id, 'memories', _type, _id)

          Utils.validate_query_params! args
          transport.perform_delete_request method, url, args, body, headers
        end
      end
    end
  end
end
