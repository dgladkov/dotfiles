#!/bin/bash

EXCLUDES=(_pip)

for f in .zsh/completions/*; do
    filename=`basename $f`
    if [[ ! ${EXCLUDES[*]} =~ "$filename" ]]; then
        wget -N --directory-prefix=./.zsh/completions "https://raw.github.com/zsh-users/zsh-completions/master/src/$filename"
    fi
done

unset filename
unset EXCLUDES
