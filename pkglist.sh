#!/bin/bash


readonly sdk_info_file=${HOME}/tizen-sdk/sdk.info
readonly tizen_sdk_dir=`sed -ne 's$TIZEN_SDK_INSTALLED_PATH=\(.*\)$\1$p' ${sdk_info_file}`
readonly info_dir=${tizen_sdk_dir}/.info
readonly meta_list_file=installedpackage.list

usage () {
	echo "Usage: `basename $0`"
}

if [ "$#" -ne 0 ] ; then
	usage
	exit 1
fi

sed -n 's/^Package: \(.*\)*$/\1/p' ${info_dir}/${meta_list_file} | sort
