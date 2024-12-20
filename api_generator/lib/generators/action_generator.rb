# SPDX-License-Identifier: Apache-2.0
#
# The OpenSearch Contributors require contributions made to
# this file be licensed under the Apache-2.0 license or a
# compatible open source license.

# frozen_string_literal: true

require_relative 'base_generator'
require_relative '../components/action'
require_relative '../components/api_path'

# Render an API Action via Mustache
class ActionRenderer < BaseGenerator
  self.template_file = './lib/templates/action.mustache'
  attr_reader :module_name, :method_name, :valid_params_constant_name,
              :method_description, :argument_descriptions, :api_reference

  # @param [Pathname] gem_folder
  # @param [Namespace] namespace
  # @param [Action] action
  def initialize(gem_folder, namespace, action)
    output_file = gem_folder.join('lib', 'opensearch', 'api', 'actions', namespace.name, "#{action.name.underscore}.rb")
    super(output_file)
    @action = action
    @api_reference = action.api_reference
    @module_name = namespace.root ? 'Root' : namespace.name.camelize
    @method_name = action.name.underscore
    @valid_params_constant_name = "#{action.name.upcase}_QUERY_PARAMS"
    @method_description = action.description.squeeze("\n").gsub("\n", "\n        # ")
  end

  def argument_descriptions
    @action.arguments.map do |arg|
      { data_type: arg.type,
        name: arg.name,
        required: arg.required,
        description: arg.description&.gsub("\n", ' ')&.strip,
        default: arg.default,
        deprecated: arg.deprecated }
    end
  end

  def url
    api_path = ApiPath.new(@action.urls.max_by(&:length))
    api_path.build
  end

  def has_query
    @action.query_params.any?
  end

  def http_verb
    case @action.http_verbs.sort
    when %w[GET POST]
      "body ? 'POST' : 'GET'"
    when %w[POST PUT]
      optional = @action.path_params.find { |arg| arg.required == false }
      return "'POST'" unless optional
      "_#{optional.name}.nil? ? 'POST' : 'PUT'"
    else
      "'#{@action.http_verbs.first}'"
    end
  end

  def required_args
    @action.arguments.filter(&:required).map { |arg| { arg: arg.name } }
           .tap { |args| args.last&.[]=('_blank_line', true) }
  end

  def bulk_body
    @action.arguments.find { |arg| arg.name == 'body' }&.schema&.type == 'array'
  end

  def support_ignore
    @action.http_verbs == %w[DELETE]
  end

  def path_params
    @action.path_params.map { |arg| { name: arg.name } }
           .tap { |args| args.last&.[]=('_blank_line', true) }
  end

  def query_params
    @action.query_params.map { |arg| { name: arg.name } }
  end

  def perform_request
    args = 'method, url, args, body, headers'
    return "transport.perform_ping_request #{args}" if @action.full_name == 'ping'
    return "transport.perform_head_request #{args}" if @action.http_verbs == %w[HEAD]
    return "transport.perform_delete_request #{args}, ignore.include?(404)" if @action.http_verbs == %w[DELETE]
    "transport.perform_request(#{args}).body"
  end
end
