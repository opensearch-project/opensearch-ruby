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
    module Notifications
      module Actions
        # Delete multiple channel configurations.
        #
        # @option args [String] :config_id *Required* The ID of the channel configuration to delete.
        # @option args [String] :config_id_list A comma-separated list of channel IDs to delete.
        # @option args [List] :ignore set to [404] to ignore server's NOT FOUND error for this request
        def delete_configs(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'config_id' missing" if args['config_id'].nil?

          ignore  = args.delete('ignore') || []
          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'DELETE'
          url     = '_plugins/_notifications/configs'

          Utils.validate_query_params! args, DELETE_CONFIGS_QUERY_PARAMS
          transport.perform_delete_request method, url, args, body, headers, ignore.include?(404)
        end

        DELETE_CONFIGS_QUERY_PARAMS = Set.new(%w[
          config_id
          config_id_list
        ]).freeze
      end
    end
  end
end
