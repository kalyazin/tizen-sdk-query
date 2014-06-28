#!/bin/bash

set -e

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

if check_pkg ${pn} ; then
        echo "No package with name '${pn}'" 1>&2
        exit 1
fi

cat ${info_dir}/${pn}/${pn}.list
