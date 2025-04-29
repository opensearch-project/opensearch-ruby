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
    module Observability
      module Actions
        # Deletes specific observability objects specified by ID or a list of IDs.
        #
        # @option args [String] :objectId The ID of a single observability object to delete.
        # @option args [String] :objectIdList A comma-separated list of observability object IDs to delete.
        def delete_objects(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'DELETE'
          url     = '_plugins/_observability/object'

          Utils.validate_query_params! args, DELETE_OBJECTS_QUERY_PARAMS
          transport.perform_delete_request method, url, args, body, headers
        end

        DELETE_OBJECTS_QUERY_PARAMS = Set.new(%w[
          objectId
          objectIdList
        ]).freeze
      end
    end
  end
end
