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
        # Explicitly clears the search context for a scroll.
        #
        # @option args [Enumerable<String>, String] :scroll_id DEPRECATED Comma-separated list of scroll IDs to clear. To clear all scroll IDs, use `_all`.
        # @option args [Hash] :body Comma-separated list of scroll IDs to clear if none was specified using the `scroll_id` parameter
        def clear_scroll(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          _scroll_id = args.delete('scroll_id')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'DELETE'
          url     = Utils.build_url('_search/scroll', _scroll_id)

          Utils.validate_query_params! args
          transport.perform_delete_request method, url, args, body, headers
        end
      end
    end
  end
end
