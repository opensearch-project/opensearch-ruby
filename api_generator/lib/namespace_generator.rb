# SPDX-License-Identifier: Apache-2.0
#
# The OpenSearch Contributors require contributions made to
# this file be licensed under the Apache-2.0 license or a
# compatible open source license.

# frozen_string_literal: true

require_relative 'base_generator'

# Generate a Namespace file via Mustache
class NamespaceGenerator < BaseGenerator
  self.template_file = './templates/namespace.mustache'
  attr_reader :namespace

  def initialize(output_folder, namespace)
    super(output_folder)
    @namespace = namespace
  end

  def module_name
    @namespace.camelize
  end

  def client_name
    "#{@namespace.camelize}Client"
  end

  def generate(existing_namespaces)
    return if @namespace.nil? || @namespace.in?(existing_namespaces)
    existing_namespaces.add(@namespace)
    super()
  end

  private

  def output_file
    create_folder(@output_folder).join("#{@namespace}.rb")
  end
end
