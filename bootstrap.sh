#!/bin/bash

function doIt() {
	local files=`git ls-tree --name-only HEAD`

	for i in $files; do
		rm -rf "$HOME/$i"
    	ln -s "$PWD/$i" "$HOME/$i"
	done

	local zsh=`grep -m 1 zsh /etc/shells`
	if [[ "$SHELL" = *zsh ]]; then
		`$zsh && source "$HOME/.zshrc"`
	else
		if [[ -n $zsh ]]; then
			read -n 1 -p "Change your default shell to zsh? (y/n) "
			echo
			chsh -s /bin/sh
			`$zsh`
		else
			echo "Please install zsh and make it default shell"
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
