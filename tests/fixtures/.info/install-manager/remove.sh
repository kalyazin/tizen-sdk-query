#!/bin/bash -ex

##remove installmanager shortcut
INSTALLMANAGER_DESKTOP_FILE_PATH=${HOME}/.local/share/applications/tizen-sdk-installmanager.desktop
${REMOVE_SHORTCUT} ${INSTALLMANAGER_DESKTOP_FILE_PATH}
