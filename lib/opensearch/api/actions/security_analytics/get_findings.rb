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
    module SecurityAnalytics
      module Actions
        # Retrieve findings related to a specific detector type or detector ID.
        #
        # @option args [String] :detectionType (default: rule) The detection type that dictates the retrieval type for the findings. When the detection type is `threat`, it fetches threat intelligence feeds. When the detection type is `rule`, findings are fetched based on the detector’s rule. Optional.
        # @option args [String] :detectorType The type of detector used to fetch alerts. Optional when the `detector_id` is specified. Otherwise required.
        # @option args [String] :detector_id The ID of the detector used to fetch alerts. Optional when the `detectorType` is specified. Otherwise required.
        # @option args [String] :endTime The end timestamp (in ms) of the time window in which you want to retrieve findings. Optional.
        # @option args [String] :findingIds The comma-separated id list of findings for which you want retrieve details. Optional.
        # @option args [String] :missing Used to sort by whether the field `missing` exists or not in the documents associated with the finding. Optional.
        # @option args [String] :searchString The finding attribute you want returned in the search. To search in a specific index, specify the index name in the request path. For example, to search findings in the indexABC index, use `searchString=indexABC’. Optional.
        # @option args [String] :severity The rule severity for which retrieve findings. Severity can be `critical`, `high`, `medium`, or `low`. Optional.
        # @option args [Integer] :size (default: 20) The maximum number of results returned in the response. Optional.
        # @option args [String] :sortOrder (default: asc) The order used to sort the list of findings. Possible values are `asc` or `desc`. Optional.
        # @option args [String] :sortString (default: timestamp) The string used by the Alerting plugin to sort the findings. Optional.
        # @option args [Integer] :startIndex (default: 0) The pagination index. Optional.
        # @option args [Integer] :startTime The beginning timestamp (in ms) of the time window in which you want to retrieve findings. Optional.
        def get_findings(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'GET'
          url     = '_plugins/_security_analytics/findings/_search'

          Utils.validate_query_params! args, GET_FINDINGS_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        GET_FINDINGS_QUERY_PARAMS = Set.new(%w[
          detectionType
          detectorType
          detector_id
          endTime
          findingIds
          missing
          searchString
          severity
          size
          sortOrder
          sortString
          startIndex
          startTime
        ]).freeze
      end
    end
  end
end
