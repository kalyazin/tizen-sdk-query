#!/bin/bash -x
## Register .desktop file
DESKTOP_FILE_PATH="${HOME}/.local/share/applications/native-ui-effect-builder.desktop"
${REMOVE_SHORTCUT} ${DESKTOP_FILE_PATH}
#xdg-desktop-menu uninstall ${MENU_DIRECTORY_NAME} native-ui-effect-builder.desktop
### END Register Menu ###
## Remove auto creating files
native_ui_effect_builder_path=tools/native-ui-effect-builder
rm -rf ${INSTALLED_PATH}/${ native_ui_effect_builder_path }/configuration
rm -rf ${INSTALLED_PATH}/${ native_ui_effect_builder_path }/plugins
rm -rf ${INSTALLED_PATH}/${ native_ui_effect_builder_path }/resources
rm -rf ${INSTALLED_PATH}/${ native_ui_effect_builder_path }/data
rm -rf ${INSTALLED_PATH}/${ native_ui_effect_builder_path }/images
rmdir ${INSTALLED_PATH}/${native_ui_effect_builder_path}
### End ###

