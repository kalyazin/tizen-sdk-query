#!/bin/bash

readonly tests_dir="$( cd "$( dirname `readlink -f ${BASH_SOURCE[0]}` )" && pwd )"
readonly scripts_dir=${tests_dir}/../scripts
source ${tests_dir}/test_common.sh

script=${scripts_dir}/pkglist.sh

contains_inst_mgr () {
	contains install-manager
}

contains_ess_comp () {
	contains ESSENTIAL-COMPONENT
}

check_output_custom "pkglist 1" contains_inst_mgr bash ${script}
check_output_custom "pkglist 2" contains_inst_mgr bash ${script}
