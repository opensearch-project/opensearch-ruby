#!/bin/bash
# SPDX-License-Identifier: Apache-2.0
#
# The OpenSearch Contributors require contributions made to
# this file be licensed under the Apache-2.0 license or a
# compatible open source license.
#
# Modifications Copyright OpenSearch Contributors. See
# GitHub history for details.

# This script accepts a gem name as argument. It builds the gem and package it as an artifact
set -e

if [[ "$1" == "" ]]; then
  echo "Please provide the gem name"
  exit 1
fi

GIT_ROOT=$(git rev-parse --show-toplevel)

echo Building "$1" gem
cd "$GIT_ROOT/$1";
rm -rf dist && mkdir dist
gem build "$1.gemspec"
mv -v "$1"*.gem dist
tar -vczf "$GIT_ROOT/artifacts.tar.gz" dist
cd "$GIT_ROOT"
