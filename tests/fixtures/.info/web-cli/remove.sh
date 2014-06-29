#!/bin/bash -xe

## Remove web-cli symbolic link files
TIZEN_SDK_INSTALL_PATH=${INSTALLED_PATH}
tools_path=${TIZEN_SDK_INSTALL_PATH}/tools

rm -rf ${tools_path}/web-*
rm ${tools_path}/webtizen

### End ###
