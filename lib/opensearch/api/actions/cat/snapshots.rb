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
    module Cat
      module Actions
        # Lists all of the snapshots stored in a specific repository.
        #
        # @option args [String] :cluster_manager_timeout The amount of time allowed to establish a connection to the cluster manager node.
        # @option args [String] :format A short version of the `Accept` header, such as `json` or `yaml`.
        # @option args [Enumerable<String>] :h A comma-separated list of column names to display.
        # @option args [Boolean] :help Returns help information.
        # @option args [Boolean] :ignore_unavailable When `true`, the response does not include information from unavailable snapshots.
        # @option args [String] :master_timeout DEPRECATED The amount of time allowed to establish a connection to the cluster manager node.
        # @option args [Enumerable<String>, String] :repository *Required* A comma-separated list of snapshot repositories used to limit the request. Accepts wildcard expressions. `_all` returns all repositories. If any repository fails during the request, OpenSearch returns an error.
        # @option args [Enumerable<String>] :s A comma-separated list of column names or column aliases to sort by.
        # @option args [String] :time Specifies the time units, for example, `5d` or `7h`. For more information, see [Supported units](https://opensearch.org/docs/latest/api-reference/units/).
        # @option args [Boolean] :v Enables verbose mode, which displays column headers.
        def snapshots(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'repository' missing" if args['repository'].nil?

          _repository = args.delete('repository')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'GET'
          url     = Utils.build_url('_cat/snapshots', _repository)

          Utils.validate_query_params! args, SNAPSHOTS_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        SNAPSHOTS_QUERY_PARAMS = Set.new(%w[
          cluster_manager_timeout
          format
          h
          help
          ignore_unavailable
          master_timeout
          s
          time
          v
        ]).freeze
      end
    end
  end
end
