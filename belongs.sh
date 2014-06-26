#!/bin/bash


readonly sdk_info_file=${HOME}/tizen-sdk/sdk.info
readonly tizen_sdk_dir=`sed -ne 's$TIZEN_SDK_INSTALLED_PATH=\(.*\)$\1$p' ${sdk_info_file}`
readonly info_dir=${tizen_sdk_dir}/.info
readonly meta_list_file=installedpackage.list
readonly script_files='*.sh'

usage () {
	echo "Usage: `basename $0` <filename>"
}

if [ "$#" -ne 1 ] ; then
	usage
	exit 1
fi

readonly fn="$1"

grep \
	--exclude ${meta_list_file} \
	--exclude ${script_files} \
	--recursive \
	--files-with-matches \
	--regexp '/'${fn}'$' \
	${info_dir} \
	| sed --expression 's$'"${info_dir}"'/\(.*\)/.*\.list$\1$'
