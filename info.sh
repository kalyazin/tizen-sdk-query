#!/bin/bash


readonly sdk_info_file=${HOME}/tizen-sdk/sdk.info
readonly tizen_sdk_dir=`sed -ne 's$TIZEN_SDK_INSTALLED_PATH=\(.*\)$\1$p' ${sdk_info_file}`
readonly info_dir=${tizen_sdk_dir}/.info
readonly meta_list_file=installedpackage.list

usage () {
	echo "Usage: `basename $0` <pkgname>"
}

if [ "$#" -ne 1 ] ; then
	usage
	exit 1
fi

readonly pn="$1"

sed -n '/Package: '${pn}'/,/^$/p' ${info_dir}/${meta_list_file} | head -n -1
