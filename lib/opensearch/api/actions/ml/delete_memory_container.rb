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
        # Delete a memory container.
        #
        # @option args [String] :memory_container_id *Required*
        # @option args [Boolean] :delete_all_memories
        # @option args [Enumerable<String>] :delete_memories
        def delete_memory_container(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'memory_container_id' missing" if args['memory_container_id'].nil?

          _memory_container_id = args.delete('memory_container_id')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'DELETE'
          url     = Utils.build_url('_plugins/_ml/memory_containers', _memory_container_id)

          Utils.validate_query_params! args, DELETE_MEMORY_CONTAINER_QUERY_PARAMS
          transport.perform_delete_request method, url, args, body, headers
        end

        DELETE_MEMORY_CONTAINER_QUERY_PARAMS = Set.new(%w[
          delete_all_memories
          delete_memories
        ]).freeze
      end
    end
  end
end
