#!/bin/bash

set -e

readonly tests_dir="$( cd "$( dirname `readlink -f ${BASH_SOURCE[0]}` )" && pwd )"

tests=`find ${tests_dir} -name 'test_*.sh'`

for t in ${tests} ; do
	bash ${t}
done
