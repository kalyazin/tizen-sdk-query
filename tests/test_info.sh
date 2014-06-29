#!/bin/bash

set -e

readonly tests_dir="$( cd "$( dirname `readlink -f ${BASH_SOURCE[0]}` )" && pwd )"
readonly scripts_dir=${tests_dir}/../scripts
source ${tests_dir}/test_common.sh

script=${scripts_dir}/info.sh

check_output "info 1" "Package: ESSENTIAL-COMPONENT
Version: 2.2.1
OS: ubuntu-64
Build-host-os: ubuntu-32
Maintainer: Sungho Park <chywoo.park@samsung.com>, Donghoon Hyun <donghoon79.hyun@samsung.com>, YongHwan Jeon <yonghwan82.jeon@samsung.com>
Attribute: mandatory
Install-dependency: sdk-info, sdb, install-manager
Path: /binary/ESSENTIAL-COMPONENT_2.2.1_ubuntu-64.zip
Origin: http://121.133.176.49/packages/tizen_2.2
SHA256: c66f8b2d48be1dd5d4cc4188801a03eac2df3db79685bd440ba95c4864961877
Size: 1037
Uncompressed-size: 8192
C-Order: " bash ${script} ESSENTIAL-COMPONENT
check_output "info 2" "" bash ${script} ESSENTIAL
