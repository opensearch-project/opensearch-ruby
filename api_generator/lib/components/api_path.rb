# SPDX-License-Identifier: Apache-2.0
#
# The OpenSearch Contributors require contributions made to
# this file be licensed under the Apache-2.0 license or a
# compatible open source license.

# frozen_string_literal: true

class ApiPath
  # @param [String] url
  def initialize(url)
    @url = url
  end

  def build
    return "'/'" if components.empty?
    return components.first if components.size == 1
    "Utils.build_url(#{components.join(', ')})"
  end

  def components
    @components ||= @url.split('{').flat_map { |part| part.split('}') }.map do |comp|
      next "_#{comp}" unless comp.include?('/') # path param
      comp = comp.sub(%r{^/}, '').sub(%r{/$}, '') # remove leading/trailing slashes
      "'#{comp}'" if comp.present?
    end.compact
  end

  private
end