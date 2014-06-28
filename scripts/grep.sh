#!/bin/bash


readonly scripts_dir="$( cd "$( dirname `readlink -f ${BASH_SOURCE[0]}` )" && pwd )"
source ${scripts_dir}/utils.sh

readonly script_files='*.sh'

usage () {
	echo "Usage: `basename $0` <pattern>"
}

if [ "$#" -ne 1 ] ; then
	usage
	exit 1
fi

readonly p="$1"

grep \
	--exclude ${meta_list_file} \
	--exclude ${script_files} \
	--recursive \
	--regexp ${p} \
	${info_dir} \
	| sed --expression 's$'"${info_dir}"'/\(.*\)/.*\.list:\(.*\)\$$\1: \2$'
