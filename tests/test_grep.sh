#!/bin/bash

set -e

readonly tests_dir="$( cd "$( dirname `readlink -f ${BASH_SOURCE[0]}` )" && pwd )"
readonly scripts_dir=${tests_dir}/../scripts
source ${tests_dir}/test_common.sh

script=${scripts_dir}/grep.sh

check_output "grep 1" "install-manager: install-manager/inst-manager.bin" bash ${script} inst-
check_output "grep 2" "" bash ${script} inst-123
