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
    module Root
      module Actions
        # Allows to use the Mustache language to pre-render a search definition.
        #
        # @option args [String] :id ID of the search template to render. If no `source` is specified, this or the `id` request body parameter is required.
        # @option args [Hash] :body The search definition template and its parameters.
        def render_search_template(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          _id = args.delete('id')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = body ? 'POST' : 'GET'
          url     = Utils.build_url('_render/template', _id)

          Utils.validate_query_params! args
          transport.perform_request(method, url, args, body, headers).body
        end
      end
    end
  end
end
