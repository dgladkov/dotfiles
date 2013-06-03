#!/bin/bash

EXCLUDES=(_pip)

for f in .zshfuncs/*; do
    filename=`basename $f`
    if [[ ! ${EXCLUDES[*]} =~ "$filename" ]]; then
        echo wget -N --directory-prefix=./.zshfuncs "https://raw.github.com/zsh-users/zsh-completions/master/src/$filename"
    fi
done

unset filename
