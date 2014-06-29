#!/bin/sh

desktoppath=~/.local/share/applications
## Register .desktop file
${REMOVE_SHORTCUT}  $desktoppath/tizen-sdk-em.desktop
### END Register Menu ###

## Remove icon file ##
rm -f ~/.local/share/icons/em.ico
## End remove icon file ##

## Remove $user.lock file
TIZEN_SDK_INSTALL_PATH=`echo $INSTALLED_PATH`
if [ -z $TIZEN_SDK_INSTALL_PATH ]
then
#   echo "There is no TIZEN_SDK_PATH ENV" >> /tmp/emulator.log
   exit 2;
fi

#echo $TIZEN_SDK_INSTALL_PATH/tools/emulator/bin/.$USER.lock
rm -f $TIZEN_SDK_INSTALL_PATH/tools/emulator/bin/.$USER.lock
