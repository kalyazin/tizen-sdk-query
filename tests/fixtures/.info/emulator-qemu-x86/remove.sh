#!/bin/bash -ex

TIZEN_SDK_INSTALL_PATH=`echo ${INSTALLED_PATH}`
if [ -z ${TIZEN_SDK_INSTALL_PATH} ]
then
#   echo "There is no TIZEN_SDK_PATH ENV" >> /tmp/emulator.log
   exit 2;
fi

LSB_RELEASE=`which lsb_release`
if [ "${LSB_RELEASE}" = "" ]; then
	if [ -e /etc/os-release ]; then
		OS_NAME=`cat /etc/os-release | grep ID | head -n 1 | awk -F= '{print $2}'`
	fi
	# TODO: Detect other linux distributions.
else
	OS_NAME=`lsb_release --id --short`
fi

if [ ! -z "${OS_NAME}" ]; then
	OS_NAME=`echo ${OS_NAME} | tr '[:upper:]' '[:lower:]'`
fi
echo "Linux Distribution: ${OS_NAME}"

TMP_FILE=remove_tizen-kvm.sh
echo "#!/bin/bash -ex" >> ${TMP_FILE}
if [ "ubuntu" = "${OS_NAME}" ] ; then
	echo "update-rc.d -f tizen-kvm remove" >> ${TMP_FILE}
fi
echo "rm -f /etc/init.d/tizen-kvm" >> ${TMP_FILE}
echo "rm -f /lib/udev/rules.d/45-tizen-kvm.rules" >> ${TMP_FILE}

chmod +x ${TMP_FILE}

if [ "${TSUDO}" != "" ] # since installer v2.27
then
	TSUDO_MSG="Enter your password to remove /etc/init.d/tizen-kvm."
	TMP_PATH="`pwd`/${TMP_FILE}"
	$TSUDO -m "${TSUDO_MSG}" sh ${TMP_PATH}
else
	GKSUDO=`which gksudo`
	if [ "${GKSUDO}" = "" ]
	then
		echo "there is no gksudo."
		sudo ./${TMP_FILE}
	else
		gksudo ./${TMP_FILE}
	fi
fi

rm ${TMP_FILE}
