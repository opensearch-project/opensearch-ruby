#!/bin/bash
# SPDX-License-Identifier: Apache-2.0
#
# The OpenSearch Contributors require contributions made to
# this file be licensed under the Apache-2.0 license or a
# compatible open source license.
#
# Modifications Copyright OpenSearch Contributors. See
# GitHub history for details.

# This is intended to be run the  root directory. `release/build.sh`
set -e

GIT_ROOT=`git rev-parse --show-toplevel`

cd $GIT_ROOT # We need to start from repository root

rm -rf dist
mkdir dist

#####################################################
#      Building opensearch-api                      #
#                                                   #
#####################################################

echo 'Building opensearch-api'
cd opensearch-api;
gem build opensearch-api.gemspec

echo 'Move Gem Location'
mv -v opensearch-api*.gem $GIT_ROOT/dist/

#####################################################
#      Building opensearch-transport                #
#                                                   #
#####################################################
cd $GIT_ROOT
echo 'Building opensearch-transport'
cd opensearch-transport;
gem build opensearch-transport.gemspec

echo 'Move Gem Location'
mv -v opensearch-transport*.gem $GIT_ROOT/dist/


#####################################################
#      Building opensearch                          #
#                                                   #
#####################################################
cd $GIT_ROOT
echo 'Building opensearch'
cd opensearch;
gem build opensearch.gemspec

echo 'Move Gem Location'
mv -v opensearch*.gem $GIT_ROOT/dist/


#####################################################
#      Building opensearch-dsl                      #
#                                                   #
#####################################################
cd $GIT_ROOT
echo 'Building opensearch-dsl'
cd opensearch-dsl;
gem build opensearch-dsl.gemspec

echo 'Move Gem Location'
mv -v opensearch-dsl*.gem $GIT_ROOT/dist/


#####################################################
#      Building opensearch-aws-sigv4                #
#                                                   #
#####################################################
cd $GIT_ROOT
echo 'Building opensearch-aws-sigv4'
cd opensearch-aws-sigv4;
gem build opensearch-aws-sigv4.gemspec

echo 'Move Gem Location'
mv -v opensearch-aws-sigv4*.gem $GIT_ROOT/dist/


#####################################################
echo 'List gems to be published: '
ls -l $GIT_ROOT/dist
