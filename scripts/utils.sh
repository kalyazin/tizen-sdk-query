#!/bin/bash

set -e

readonly sdk_info_file=${HOME}/tizen-sdk/sdk.info
readonly tizen_sdk_dir=`sed -ne 's$TIZEN_SDK_INSTALLED_PATH=\(.*\)$\1$p' ${sdk_info_file}`
readonly info_dir=${tizen_sdk_dir}/.info
readonly meta_list_file=installedpackage.list

check_pkg () {
	local _pn="$1"
	if ! grep '^Package: '"${_pn}"'$' ${info_dir}/${meta_list_file} >& /dev/null ; then
		return 0
	else
		return 1
	fi
}

get_deps () {
	local _pn="$1"
	sed -n '/Package: '${_pn}'/,/^$/p' ${info_dir}/${meta_list_file} \
		| head -n -1 \
		| awk -F ':' '/Install-dependency: /{ print $2 }' \
		| tr -d ' ' \
		| awk -F ',' '{ for (i=1; i<=NF; i++) print $i }' \
		| sort
}

pkg_list () {
	sed -n 's/^Package: \(.*\)*$/\1/p' ${info_dir}/${meta_list_file} | sort
}

depends () {
	local _pn="$1"
	local deps=""
	for p in `pkg_list` ; do
		if [ "${p}" != "${_pn}" ] ; then
			local d=`get_deps ${p}`
			if [[ ! -z "$d" \
				&& ! -z `echo "$d" | grep ^${_pn}\$` ]] ; then
				deps+=" ${p}"
			fi
		fi
	done
	if [ ! -z "${deps}" ] ; then
		echo ${deps} | tr ' ' '\n' | sort -u
	fi
}
