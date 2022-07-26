#!/bin/bash

IFS_BACKUP=$IFS
IFS=$'\n'

XML_DIR=./xml
THEME_FONTS_DIR="${HOME}/Library/Group Containers/UBF8T346G9.Office/User Content.localized/Themes.localized/Theme Fonts"

# relink dst src
relink() {
	if [[ "$2" -ef "$1" ]]; then
		echo "Relinking $1 (Hard link)"
		rm "$1"
		# Hard link? Then recreate.
		ln -n "$2" "$1"
	elif [[ -h "$1" ]]; then
		echo "Relinking $1 (Symbolic link)"
		# Symbolic link? Then recreate.
		rm "$1"
		ln -sn "$2" "$1"
	elif [[ ! -e "$1" ]]; then
		echo "Linking $1 to $2"
		# ln -sn "$2" "$1"
		ln -n "$2" "$1"
	else
		echo "$1 exists as a real file, skipping."
	fi
}

echo "XMLs: ${XML_DIR}"
echo "Theme DIR: ${THEME_FONTS_DIR}"

for XML in `find ${XML_DIR} -maxdepth 1 -type f -name *.xml | awk -F"/" '{ print $NF }'`;
do
	relink ${THEME_FONTS_DIR}/${XML} ${XML_DIR}/${XML}
done
