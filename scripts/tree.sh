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

wo_deps=""
pp=`pkg_list`
for p in ${pp} ; do
	if [ -z "`depends ${p}`" ] ; then
		wo_deps+=" ${p}"
	fi
done

print_deps_rec () {
	local _pn="$1"
	local _lv="$2"
	for i in `seq ${_lv}` ; do
		echo -n " "
	done
	echo ${_pn}
	if [ -z "`get_deps ${_pn}`" ] ; then
		return
	fi
	for p in `get_deps ${_pn}` ; do
		print_deps_rec ${p} $((_lv+4))
	done
}

for p in ${wo_deps} ; do
	print_deps_rec ${p} 0
done
