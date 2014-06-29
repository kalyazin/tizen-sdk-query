#!/bin/bash -x
## Register .desktop file
DESKTOP_FILE_PATH="${HOME}/.local/share/applications/tizen-sdk-dynamicanalyzer.desktop"
${REMOVE_SHORTCUT} ${DESKTOP_FILE_PATH}
#xdg-desktop-menu uninstall ${MENU_DIRECTORY_NAME} tizen-sdk-dynamicanalyzer.desktop
### END Register Menu ###

## Remove auto creating files
da_path=tools/dynamic-analyzer
rm -rf ${INSTALLED_PATH}/${da_path}/configuration
rm -rf ${INSTALLED_PATH}/${da_path}/save
rm -rf ${INSTALLED_PATH}/${da_path}/workspace
rm -rf ${INSTALLED_PATH}/${da_path}/fileLock
rmdir ${INSTALLED_PATH}/${da_path}

### End ###
