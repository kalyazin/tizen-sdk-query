#!/bin/bash


readonly scripts_dir="$( cd "$( dirname `readlink -f ${BASH_SOURCE[0]}` )" && pwd )"
source ${scripts_dir}/utils.sh

usage () {
	echo "Usage: `basename $0` <pkgname>"
}

if [ "$#" -ne 1 ] ; then
	usage
	exit 1
fi

readonly pn="$1"

if ! grep "Package: ${pn}" ${info_dir}/${meta_list_file} >& /dev/null ; then
        echo "No package with name '${pn}'" 1>&2
        exit 1
fi

sed -n '/Package: '${pn}'/,/^$/p' ${info_dir}/${meta_list_file} \
        | head -n -1 \
        | awk -F ':' '/Install/{ print $2 }' \
        | tr -d ' ' \
        | awk -F '[, ]' '{ for (i=1; i<=NF; i++) print $i }' \
        | sort
