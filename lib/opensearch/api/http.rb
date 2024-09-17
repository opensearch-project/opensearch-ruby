# SPDX-License-Identifier: Apache-2.0
#
# The OpenSearch Contributors require contributions made to
# this file be licensed under the Apache-2.0 license or a
# compatible open source license.

# frozen_string_literal: true

module OpenSearch
  module API
    module Http
      module Actions
        # Make a customized CONNECT request.
        #
        # @option arguments [String] :url Relative path to the endpoint (e.g. 'cat/indices/books,movies') (*Required*)
        # @option arguments [Hash] :params Querystring parameters to be appended to the path
        # @option arguments [Hash] :headers Custom HTTP headers
        # @option arguments [String | Hash | Array<Hash>] :body The body of the request
        def connect(url, headers: {}, body: nil, params: {})
          request('CONNECT', url, headers: headers, body: body, params: params)
        end

        # Make a customized DELETE request.
        #
        # @option arguments [String] :url Relative path to the endpoint (e.g. 'cat/indices/books,movies') (*Required*)
        # @option arguments [Hash] :params Querystring parameters to be appended to the path
        # @option arguments [Hash] :headers Custom HTTP headers
        # @option arguments [String | Hash | Array<Hash>] :body The body of the request
        def delete(url, headers: {}, body: nil, params: {})
          request('DELETE', url, headers: headers, body: body, params: params)
        end

        # Make a customized GET request.
        #
        # @option arguments [String] :url Relative path to the endpoint (e.g. 'cat/indices/books,movies') (*Required*)
        # @option arguments [Hash] :params Querystring parameters to be appended to the path
        # @option arguments [Hash] :headers Custom HTTP headers
        # @option arguments [String | Hash | Array<Hash>] :body The body of the request
        def get(url, headers: {}, body: nil, params: {})
          request('GET', url, headers: headers, body: body, params: params)
        end

        # Make a customized HEAD request.
        #
        # @option arguments [String] :url Relative path to the endpoint (e.g. 'cat/indices/books,movies') (*Required*)
        # @option arguments [Hash] :params Querystring parameters to be appended to the path
        # @option arguments [Hash] :headers Custom HTTP headers
        # @option arguments [String | Hash | Array<Hash>] :body The body of the request
        def head(url, headers: {}, body: nil, params: {})
          request('HEAD', url, headers: headers, body: body, params: params)
        end

        # Make a customized OPTIONS request.
        #
        # @option arguments [String] :url Relative path to the endpoint (e.g. 'cat/indices/books,movies') (*Required*)
        # @option arguments [Hash] :params Querystring parameters to be appended to the path
        # @option arguments [Hash] :headers Custom HTTP headers
        # @option arguments [String | Hash | Array<Hash>] :body The body of the request
        def options(url, headers: {}, body: nil, params: {})
          request('OPTIONS', url, headers: headers, body: body, params: params)
        end

        # Make a customized POST request.
        #
        # @option arguments [String] :url Relative path to the endpoint (e.g. 'cat/indices/books,movies') (*Required*)
        # @option arguments [Hash] :params Querystring parameters to be appended to the path
        # @option arguments [Hash] :headers Custom HTTP headers
        # @option arguments [String | Hash | Array<Hash>] :body The body of the request
        def post(url, headers: {}, body: nil, params: {})
          request('POST', url, headers: headers, body: body, params: params)
        end

        # Make a customized PUT request.
        #
        # @option arguments [String] :url Relative path to the endpoint (e.g. 'cat/indices/books,movies') (*Required*)
        # @option arguments [Hash] :params Querystring parameters to be appended to the path
        # @option arguments [Hash] :headers Custom HTTP headers
        # @option arguments [String | Hash | Array<Hash>] :body The body of the request
        def put(url, headers: {}, body: nil, params: {})
          request('PUT', url, headers: headers, body: body, params: params)
        end

        private

        def request(method, url, headers: {}, body: nil, params: {})
          body = OpenSearch::API::Utils.bulkify(body) if body.is_a?(Array)
          headers.merge!('Content-Type' => 'application/x-ndjson') if body.is_a?(Array)

          transport.perform_request(method, url, params, body, headers).body
        end
      end
    end
  end
end
