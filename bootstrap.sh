#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function doIt() {
	rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
		--exclude "README.md" --exclude "LICENSE-MIT.txt" -avh --no-perms . ~;
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

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
