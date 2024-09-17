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
        # Get multiple channel configurations with filtering.
        #
        # @option args [String] :chime.url
        # @option args [String] :chime.url.keyword
        # @option args [String] :config_id Notification configuration ID.
        # @option args [Enumerable<String>] :config_id_list Notification configuration IDs.
        # @option args [String] :config_type Type of notification configuration.
        # @option args [Integer] :created_time_ms
        # @option args [String] :description
        # @option args [String] :description.keyword
        # @option args [String] :email.email_account_id
        # @option args [String] :email.email_group_id_list
        # @option args [String] :email.recipient_list.recipient
        # @option args [String] :email.recipient_list.recipient.keyword
        # @option args [String] :email_group.recipient_list.recipient
        # @option args [String] :email_group.recipient_list.recipient.keyword
        # @option args [Boolean] :is_enabled
        # @option args [Integer] :last_updated_time_ms
        # @option args [String] :microsoft_teams.url
        # @option args [String] :microsoft_teams.url.keyword
        # @option args [String] :name
        # @option args [String] :name.keyword
        # @option args [String] :query
        # @option args [String] :ses_account.from_address
        # @option args [String] :ses_account.from_address.keyword
        # @option args [String] :ses_account.region
        # @option args [String] :ses_account.role_arn
        # @option args [String] :ses_account.role_arn.keyword
        # @option args [String] :slack.url
        # @option args [String] :slack.url.keyword
        # @option args [String] :smtp_account.from_address
        # @option args [String] :smtp_account.from_address.keyword
        # @option args [String] :smtp_account.host
        # @option args [String] :smtp_account.host.keyword
        # @option args [String] :smtp_account.method
        # @option args [String] :sns.role_arn
        # @option args [String] :sns.role_arn.keyword
        # @option args [String] :sns.topic_arn
        # @option args [String] :sns.topic_arn.keyword
        # @option args [String] :text_query
        # @option args [String] :webhook.url
        # @option args [String] :webhook.url.keyword
        # @option args [Hash] :body
        def get_configs(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'GET'
          url     = '_plugins/_notifications/configs'

          Utils.validate_query_params! args, GET_CONFIGS_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        GET_CONFIGS_QUERY_PARAMS = Set.new(%w[
          chime.url
          chime.url.keyword
          config_id
          config_id_list
          config_type
          created_time_ms
          description
          description.keyword
          email.email_account_id
          email.email_group_id_list
          email.recipient_list.recipient
          email.recipient_list.recipient.keyword
          email_group.recipient_list.recipient
          email_group.recipient_list.recipient.keyword
          is_enabled
          last_updated_time_ms
          microsoft_teams.url
          microsoft_teams.url.keyword
          name
          name.keyword
          query
          ses_account.from_address
          ses_account.from_address.keyword
          ses_account.region
          ses_account.role_arn
          ses_account.role_arn.keyword
          slack.url
          slack.url.keyword
          smtp_account.from_address
          smtp_account.from_address.keyword
          smtp_account.host
          smtp_account.host.keyword
          smtp_account.method
          sns.role_arn
          sns.role_arn.keyword
          sns.topic_arn
          sns.topic_arn.keyword
          text_query
          webhook.url
          webhook.url.keyword
        ]).freeze
      end
    end
  end
end
