#!/bin/bash

set -e

readonly tests_dir="$( cd "$( dirname `readlink -f ${BASH_SOURCE[0]}` )" && pwd )"
readonly scripts_dir=${tests_dir}/../scripts
source ${tests_dir}/test_common.sh

script=${scripts_dir}/tree.sh

check_output "tree 1" "base-ide-product
common-eplugin
    base-ide-product[ubuntu-64]
ESSENTIAL-COMPONENT
    install-manager
    sdb
    sdk-info
tizen-2.2-native-sample
    native-sample-2.2
tizen-2.2-rootstrap
    api-checker
    certificate-generator
    rs-device-2.2.native
    rs-emulator-2.2.native
tizen-2.2-web-sample
    web-sample-2.2
        base-ide-product[ubuntu-64]
        common-eplugin[ubuntu-64]
        webapp-eplugin[ubuntu-64]
tizen-document
    certificate-generator
    document
tizen-native-cli
    native-cli
        sdb[ubuntu-64]
tizen-native-toolchain
    sbi-toolchain-gcc-4.5.cpp.app
        cross-arm-gcc-4.5
        cross-arm-gdb-7.5
        cross-i386-gcc-4.5
        cross-i386-gdb-7.5
        sbi-toolchain-scripts
    sbi-toolchain-llvm-3.1.cpp.app
        cross-arm-gdb-7.5
        cross-i386-gdb-7.5
        llvm-3.1
            cross-arm-gcc-4.5
            cross-i386-gcc-4.5
        sbi-toolchain-scripts
    smart-build-interface
tizen-web-cli
    certificate-generator
    web-cli
        sdb[ubuntu-64]
        web-ui-fw[ubuntu-64]
tizen-websimulator-core
    websimulator-core
webapp-eplugin
    base-ide-product[ubuntu-64]
    common-eplugin[ubuntu-64]
    web-ui-fw[ubuntu-64]
web-ui-fw" bash ${script}
