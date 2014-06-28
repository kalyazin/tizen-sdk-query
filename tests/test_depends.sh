#!/bin/bash

readonly tests_dir="$( cd "$( dirname `readlink -f ${BASH_SOURCE[0]}` )" && pwd )"
readonly scripts_dir=${tests_dir}/../scripts
source ${tests_dir}/test_common.sh

script=${scripts_dir}/depends.sh

check_output "depends 1" "ESSENTIAL-COMPONENT" bash ${script} install-manager
check_output "depends 2" "" bash ${script} inst-manager
