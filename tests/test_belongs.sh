#!/bin/bash

set -e

readonly tests_dir="$( cd "$( dirname `readlink -f ${BASH_SOURCE[0]}` )" && pwd )"
readonly scripts_dir=${tests_dir}/../scripts
source ${tests_dir}/test_common.sh

script=${scripts_dir}/belongs.sh

check_output "belongs 1" "install-manager" bash ${script} inst-manager.bin
check_output "belongs 2" "" bash ${script} inst-manager
