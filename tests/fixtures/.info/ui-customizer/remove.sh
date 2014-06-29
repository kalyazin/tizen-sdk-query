#!/bin/bash -x
## Register .desktop file
DESKTOP_FILE_PATH="${HOME}/.local/share/applications/ui-customizer.desktop"
${REMOVE_SHORTCUT} ${DESKTOP_FILE_PATH}
#xdg-desktop-menu uninstall ${MENU_DIRECTORY_NAME} ui-customizer.desktop
### END Register Menu ###
## Remove auto creating files
native_ui_effect_builder_path=tools/native-ui-effect-builder
rm -rf ${INSTALLED_PATH}/${ native_ui_effect_builder_path }/configuration
rm -rf ${INSTALLED_PATH}/${ native_ui_effect_builder_path }/plugins
rm -rf ${INSTALLED_PATH}/${ native_ui_effect_builder_path }/resources
rm -rf ${INSTALLED_PATH}/${ native_ui_effect_builder_path }/workspace
rmdir ${INSTALLED_PATH}/${native_ui_effect_builder_path}
### End ###
