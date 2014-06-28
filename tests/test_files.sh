#!/bin/bash

readonly tests_dir="$( cd "$( dirname `readlink -f ${BASH_SOURCE[0]}` )" && pwd )"
readonly scripts_dir=${tests_dir}/../scripts
source ${tests_dir}/test_common.sh

script=${scripts_dir}/files.sh

check_output "files 1" "" bash ${script} ESSENTIAL-COMPONENT
check_output "files 2" "install-manager/
install-manager/InstallManagerV2.jar
install-manager/inst-manager.bin
install-manager/tizen-sdk-installmanager.png
install-manager/tizen-sdk-menu.png" bash ${script} install-manager
