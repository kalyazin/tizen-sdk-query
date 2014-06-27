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

if [ ! -f "${info_dir}/${pn}/${pn}.list" ] ; then
        echo "No package with name '${pn}'" 1>&2
        exit 1
fi

cat ${info_dir}/${pn}/${pn}.list
