#!/bin/bash

set -e

readonly scripts_dir="$( cd "$( dirname `readlink -f ${BASH_SOURCE[0]}` )" && pwd )"
source ${scripts_dir}/utils.sh

usage () {
	echo "Usage: `basename $0`"
}

if [ "$#" -ne 0 ] ; then
	usage
	exit 1
fi

pkg_list
