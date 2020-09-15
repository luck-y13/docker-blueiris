#!/bin/bash

BLUEIRIS_EXE="${WINEPREFIX}/drive_c/Program Files/Blue Iris ${BLUEIRIS_VERSION}/BlueIris.exe"
BLUEIRIS_INSTALL_PATH="${WINEPREFIX}/drive_c/Program Files/Blue Iris ${BLUEIRIS_VERSION}"
PREFIX_DIR="${WINEPREFIX}"
INSTALL_EXE="/home/wineuser/blueiris.exe"

if [ ! -d "$PREFIX_DIR/drive_c" ]; then
  chown -R wineuser:wineuser /home/wineuser
  winetricks -q annihilate || true
  winetricks win10
  winetricks -q corefonts wininet vcrun2019 mfc42
fi

wget https://blueirissoftware.com/blueiris.exe
unzip -o "${BLUEIRIS_INSTALL_PATH}/ui3.zip" -d "${BLUEIRIS_INSTALL_PATH}/www/"

wine reg import service.reg && sleep 5 && wine net start blueiris && sleep 5
wine "${BLUEIRIS_EXE}"
