#!/bin/bash -xe
## Register .desktop file
DESKTOP_FILE_PATH="${HOME}/.local/share/applications/tizen-sdk-ide.desktop"
${REMOVE_SHORTCUT} ${DESKTOP_FILE_PATH}
#xdg-desktop-menu uninstall ${MENU_DIRECTORY_NAME} tizen-sdk-ide.desktop
### END Register Menu ###

## Remove auto creating files
ide_path=ide
rm -rf ${INSTALLED_PATH}/${ide_path}/p2

rm -f ${INSTALLED_PATH}/${ide_path}/init

### End ###
