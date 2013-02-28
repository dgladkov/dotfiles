#!/bin/bash

function doIt() {
	local files=`git ls-tree --name-only HEAD`

	for i in $files; do
		rm -rf "$HOME/$i"
    	ln -s "$PWD/$i" "$HOME/$i"
	done
}

if [ "$1" = "--force" -o "$1" = "-f" ]; then
	doIt
else
	read -n 1 -sp "This WILL overwrite existing files in your home directory. Are you sure? (y/n) "
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt
	fi
fi
