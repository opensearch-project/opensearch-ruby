# SPDX-License-Identifier: Apache-2.0
#
# The OpenSearch Contributors require contributions made to
# this file be licensed under the Apache-2.0 license or a
# compatible open source license.
#
# Modifications Copyright OpenSearch Contributors. See
# GitHub history for details.

require 'opensearch-ruby'
require 'aws-sigv4/signer'
require 'faraday'
require 'json'

module OpenSearch
  module Aws
    # AWS Sigv4 Wrapper for OpenSearch::Client.
    # This client accepts a Sigv4 Signer during initialization, and signs every request
    # with a Sigv4 Signature with the provided signer.
    #
    # @example
    #   signer = Aws::Sigv4::Signer.new(service: 'es',
    #                                   region: 'us-east-1',
    #                                   access_key_id: '<access_key_id>',
    #                                   secret_access_key: '<secret_access_key>',
    #                                   session_token: '<session_token>')
    #
    #   client = OpenSearch::Aws::Sigv4Client.new(
    #       { host: 'https://my-os-domain.us-east-1.es.amazonaws.com/' },
    #       signer
    #   )
    #
    #   puts client.cat.health
    #
    # @attr [Aws::Sigv4::Signer] sigv4_signer Signer used to sign every request
    class Sigv4Client < ::OpenSearch::Client
      attr_accessor :sigv4_signer

      # @param [Hash] transport_args arguments for OpenSearch::Transport::Client.
      # @param [&block] block code block to be passed to OpenSearch::Transport::Client.
      # @param [Aws::Sigv4::Signer] sigv4_signer an instance of AWS Sigv4 Signer.
      def initialize(transport_args = {}, sigv4_signer, &block)
        unless sigv4_signer.is_a?(::Aws::Sigv4::Signer)
          raise ArgumentError, "Please pass a Aws::Sigv4::Signer. A #{sigv4_signer.class} was given."
        end

        @sigv4_signer = sigv4_signer
        super transport_args, &block
      end

      # @see OpenSearch::Transport::Transport::Base::perform_request
      def perform_request(method, path, params = {}, body = nil, headers = nil)
        verify_open_search unless @verified
        signature_body = body.is_a?(Hash) ? body.to_json : body.to_s
        signature = sigv4_signer.sign_request(
          http_method: method,
          url: signature_url(path, params),
          headers: headers,
          body: signature_body)
        headers = (headers || {}).merge(signature.headers)
        @transport.perform_request(method, path, params, body, headers)
      end

      private

      def signature_url(path, params)
        host = @transport.transport.hosts.dig(0, :host)
        path = '/' + path unless path.start_with?('/')
        query_string = params.empty? ? '' : "#{Faraday::Utils::ParamsHash[params].to_query}"
        URI::HTTP.build(host: host, path: path, query: query_string)
      end
    end
  end
end
