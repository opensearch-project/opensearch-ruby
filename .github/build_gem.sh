#!/bin/bash
# SPDX-License-Identifier: Apache-2.0
#
# The OpenSearch Contributors require contributions made to
# this file be licensed under the Apache-2.0 license or a
# compatible open source license.
#
# Modifications Copyright OpenSearch Contributors. See
# GitHub history for details.

set -e
GIT_ROOT=$(git rev-parse --show-toplevel)

rm -rf dist && mkdir dist
gem build
mv -v ./*.gem dist
tar -vczf "$GIT_ROOT/artifacts.tar.gz" dist
cd "$GIT_ROOT"
