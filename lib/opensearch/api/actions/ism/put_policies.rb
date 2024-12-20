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
    module Ism
      module Actions
        # Gets the policies.
        #
        # @option args [Float] :if_primary_term Only perform the operation if the document has this primary term.
        # @option args [Integer] :if_seq_no Only perform the operation if the document has this sequence number.
        # @option args [String] :policyID *Required*
        # @option args [Hash] :body
        def put_policies(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'policyID' missing" if args['policyID'].nil?

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'PUT'
          url     = '_plugins/_ism/policies'

          Utils.validate_query_params! args, PUT_POLICIES_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        PUT_POLICIES_QUERY_PARAMS = Set.new(%w[
          if_primary_term
          if_seq_no
          policyID
        ]).freeze
      end
    end
  end
end
