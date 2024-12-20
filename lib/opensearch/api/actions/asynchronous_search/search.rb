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
    module AsynchronousSearch
      module Actions
        # Perform an asynchronous search.
        #
        # @option args [String] :index The name of the index to be searched. Can be an individual name, a comma-separated list of indexes, or a wildcard expression of index names.
        # @option args [String] :keep_alive The amount of time that the result is saved in the cluster. For example, `2d` means that the results are stored in the cluster for 48 hours. The saved search results are deleted after this period or if the search is canceled. Note that this includes the query execution time. If the query overruns this time, the process cancels this query automatically.
        # @option args [Boolean] :keep_on_completion Whether you want to save the results in the cluster after the search is complete.
        # @option args [String] :wait_for_completion_timeout The amount of time that you plan to wait for the results. You can poll the remaining results based on an ID. The maximum value is `300s`. Default is `1s`.
        # @option args [Hash] :body The search definition using the Query DSL.
        def search(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'POST'
          url     = '_plugins/_asynchronous_search'

          Utils.validate_query_params! args, SEARCH_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        SEARCH_QUERY_PARAMS = Set.new(%w[
          index
          keep_alive
          keep_on_completion
          wait_for_completion_timeout
        ]).freeze
      end
    end
  end
end
