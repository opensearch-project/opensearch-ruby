#!/usr/bin/env bash
#
# Called by entry point `run-test` use this script to add your repository specific test commands
#
# Once called Elasticsearch is up and running
#
# Its recommended to call `imports.sh` as defined here so that you get access to all variables defined there
#
# Any parameters that test-matrix.yml defines should be declared here with appropiate defaults

script_path=$(dirname $(realpath -s $0))
source $script_path/functions/imports.sh
set -euo pipefail

echo -e "\033[34;1mINFO:\033[0m VERSION: ${STACK_VERSION}\033[0m"
echo -e "\033[34;1mINFO:\033[0m TEST_SUITE: ${TEST_SUITE}\033[0m"
echo -e "\033[34;1mINFO:\033[0m RUNSCRIPTS: ${RUNSCRIPTS}\033[0m"
echo -e "\033[34;1mINFO:\033[0m URL: ${opensearch_url}\033[0m"
echo -e "\033[34;1mINFO:\033[0m CONTAINER: ${opensearch_container}\033[0m"

#
# Ruby client setup:
#

export RUBY_TEST_VERSION=${RUBY_TEST_VERSION:-2.7.0}
export STACK_VERSION=${STACK_VERSION:-8.0.0-SNAPSHOT}
export SINGLE_TEST=${SINGLE_TEST:-}

echo -e "\033[1m>>>>> Build [elastic/opensearch-ruby container] >>>>>>>>>>>>>>>>>>>>>>>>>>>>>\033[0m"
# create client image
docker build \
       --file .ci/Dockerfile \
       --tag elastic/opensearch-ruby \
       --build-arg RUBY_TEST_VERSION=${RUBY_TEST_VERSION} \
       .

echo -e "\033[1m>>>>> Run [elastic/opensearch-ruby container] >>>>>>>>>>>>>>>>>>>>>>>>>>>>>\033[0m"

repo=`pwd`

# run the client tests
if [[ $TEST_SUITE != "platinum" ]]; then
    docker run \
           --network="${network_name}" \
           --env "TEST_OPENSEARCH_SERVER=${opensearch_url}" \
           --env "TEST_SUITE=${TEST_SUITE}" \
           --volume $repo:/usr/src/app \
           --volume=/tmp:/tmp \
           --name opensearch-ruby \
           --rm \
           elastic/opensearch-ruby \
           bundle exec rake opensearch:download_artifacts test:rest_api
else
    docker run \
           --network="${network_name}" \
           --env "TEST_OPENSEARCH_SERVER=${opensearch_url}" \
           --env "ELASTIC_PASSWORD=${elastic_password}" \
           --env "TEST_SUITE=${TEST_SUITE}" \
           --env "ELASTIC_USER=elastic" \
           --env "SINGLE_TEST=${SINGLE_TEST}" \
           --volume $repo:/usr/src/app \
           --name opensearch-ruby \
           --rm \
           elastic/opensearch-ruby \
           bundle exec rake opensearch:download_artifacts test:security
fi
