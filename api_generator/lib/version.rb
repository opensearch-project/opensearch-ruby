# SPDX-License-Identifier: Apache-2.0
#
# The OpenSearch Contributors require contributions made to
# this file be licensed under the Apache-2.0 license or a
# compatible open source license.

# frozen_string_literal: true

# OpenSearch Version Number
class Version
  include Comparable
  attr_reader :numbers

  # @param [String, NilClass] version_str
  def initialize(version_str)
    @version_str = version_str
    @numbers = version_str&.split('.')&.map(&:to_i)
  end

  # @param [Version] other
  def <=>(other)
    numbers.zip(other.numbers).each do |self_, other_|
      return 1 if self_ > other_
      return -1 if self_ < other_
    end
    0
  end

  def nil?
    numbers.nil?
  end
end
