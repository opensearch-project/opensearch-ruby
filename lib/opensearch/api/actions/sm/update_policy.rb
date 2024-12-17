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
    module Sm
      module Actions
        # Updates an existing snapshot management policy. Requires `if_seq_no` and `if_primary_term`.
        #
        # @option args [String] :policy_name *Required* The name of the snapshot management policy.
        # @option args [Integer] :if_primary_term *Required* The primary term of the policy to update.
        # @option args [Integer] :if_seq_no *Required* The sequence number of the policy to update.
        # @option args [Hash] :body
        def update_policy(args = {})
          args = Utils.normalize_arguments(args)
          raise ArgumentError, "Required argument 'policy_name' missing" unless args['policy_name']
          raise ArgumentError, "Required argument 'if_primary_term' missing" unless args['if_primary_term']
          raise ArgumentError, "Required argument 'if_seq_no' missing" unless args['if_seq_no']

          _policy_name = args.delete('policy_name')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'PUT'
          url     = ['_plugins/_sm/policies', _policy_name].filter(&:present?).join('/').squeeze('/')

          Utils.validate_query_params args, UPDATE_POLICY_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        UPDATE_POLICY_QUERY_PARAMS = Set.new(%w[
          if_primary_term
          if_seq_no
        ]).freeze
      end
    end
  end
end
