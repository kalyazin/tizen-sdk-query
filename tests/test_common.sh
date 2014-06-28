#!/bin/bash

_N='\e[39m'
_R='\e[31m'
_G='\e[32m'

readonly stderr_file=/tmp/tsq_stderr.txt

contains () {
	local to_grep="$1"
	local text=""
	while read t ; do
		text+=" ${t}"
	done
	echo ${text} | grep ${to_grep} 2>&1 > /dev/null
	return $?
}

check_output () {
	local name=$1
	local expected=$2
	shift 2
	local cmd=$@
	local out=`${cmd} 2>${stderr_file}`
	local errout=`cat ${stderr_file}` ; rm ${stderr_file}
	if [ "$?" -ne 0 ] ; then
		echo -e "[${_R}fail${_N}] test '${name}'"
		echo "exit = '$?', stderr = ${errout}"
		return 1
	fi
	if [ "${out}" != "${expected}" ] ; then
		echo -e "[${_R}fail${_N}] test '${name}'"
		echo "output = '${out}', expected = '${expected}'"
		return 1
	fi

	echo -e "[${_G}pass${_N}] test '${name}'"
	return 0
}

check_output_custom () {
	local name=$1
	local func=$2
	shift 2
	local cmd=$@
	local out=`${cmd} 2>${stderr_file}`
	local errout=`cat ${stderr_file}` ; rm ${stderr_file}
	if [ "$?" -ne 0 ] ; then
		echo -e "[${_R}fail${_N}] test '${name}'"
		echo "exit = '$?', stderr = ${errout}"
		return 1
	fi
	echo "$out" | ${func}
	if [ "$?" -ne 0 ] ; then
		echo -e "[${_R}fail${_N}] test '${name}'"
		echo "output = '${out}', expected = '${expected}'"
		return 1
	fi

	echo -e "[${_G}pass${_N}] test '${name}'"
	return 0
}
