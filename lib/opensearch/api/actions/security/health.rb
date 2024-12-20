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
    module Security
      module Actions
        # Checks to see if the Security plugin is up and running.
        #
        # @option args [String] :mode A flag to indicate whether service should consider security-plugin's status before returning health response. `strict` mode indicates service should check Security plugin status.
        def health(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = body ? 'POST' : 'GET'
          url     = '_plugins/_security/health'

          Utils.validate_query_params! args, HEALTH_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        HEALTH_QUERY_PARAMS = Set.new(%w[
          mode
        ]).freeze
      end
    end
  end
end
