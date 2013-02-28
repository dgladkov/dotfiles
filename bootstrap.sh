#!/bin/bash

function doIt() {
	local files=`git ls-tree --name-only HEAD`

	for i in $files; do
		if [[ $i == \.* ]]; then
			rm -rf "$HOME/$i"
    		ln -s "$PWD/$i" "$HOME/$i"
    	fi
	done

	local zsh=`grep -m 1 zsh /etc/shells`
	if [[ "$SHELL" = *zsh ]]; then
		exec "$zsh"
	else
		if [[ -n $zsh ]]; then
			read -n 1 -p "Change your default shell to zsh? (y/n) "
			echo
			chsh -s /bin/sh
			exec "$zsh"
		else
			echo "Please install zsh package using your package manager"
		fi
	fi
}

if [ "$1" = "--force" -o "$1" = "-f" ]; then
	doIt
else
	read -n 1 -p "This WILL overwrite existing files in your home directory. Are you sure? (y/n) "
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt
	fi
fi

unset doIt
