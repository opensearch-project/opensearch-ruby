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
    module SearchRelevance
      module Actions
        # Deletes a specified search configuration.
        #
        # @option args [String] :search_configuration_id *Required* The search configuration id
        def delete_search_configurations(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'search_configuration_id' missing" if args['search_configuration_id'].nil?

          _search_configuration_id = args.delete('search_configuration_id')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'DELETE'
          url     = Utils.build_url('_plugins/search_relevance/search_configurations', _search_configuration_id)

          Utils.validate_query_params! args
          transport.perform_delete_request method, url, args, body, headers
        end
      end
    end
  end
end
