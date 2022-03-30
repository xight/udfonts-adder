#!/bin/bash

IFS_BACKUP=$IFS
IFS=$'\n'

XML_DIR=./xml
THEME_FONTS_DIR="${HOME}/Library/Group Containers/UBF8T346G9.Office/User Content.localized/Themes.localized/Theme Fonts"

echo "XMLs: ${XML_DIR}"
echo "Theme DIR: ${THEME_FONTS_DIR}"

for XML in `find ${XML_DIR} -maxdepth 1 -type f -name *.xml`;
do
	cp -v ${XML} ${THEME_FONTS_DIR}
done
