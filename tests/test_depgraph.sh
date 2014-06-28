#!/bin/bash

readonly tests_dir="$( cd "$( dirname `readlink -f ${BASH_SOURCE[0]}` )" && pwd )"
readonly scripts_dir=${tests_dir}/../scripts
source ${tests_dir}/test_common.sh

script=${scripts_dir}/depgraph.sh

check_output "depgraph 1" "install-manager
sdb
sdk-info" bash ${script} ESSENTIAL-COMPONENT
check_output "depgraph 2" "" bash ${script} install-manager
