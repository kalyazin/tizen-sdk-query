#!/bin/sh

## [ Install Manager's reserved word ]
## - MENU_DIRECTORY_PATH
## - MENU_DIRECTORY_NAME
## - INSTALLED_PATH
## - SDK_DATA_PATH

## Unregister .desktop file
##xdg-desktop-menu uninstall ${MENU_DIRECTORY_NAME} wac-ide.desktop

## Remove auto creating files
##rm -rf ${INSTALLED_PATH}/WebIDE/p2

WEBKIT_LIB_LINUX_PATH="${INSTALLED_PATH}/library/webkit"
rm -rf ${WEBKIT_LIB_LINUX_PATH}

exit 0
