#!/bin/bash

EXCLUDES=(django_bash_completion celery.zsh _gem)

for f in .zsh/completions/*; do
    filename=`basename $f`
    if [[ ! ${EXCLUDES[*]} =~ "$filename" ]]; then
        wget -N --directory-prefix=./.zsh/completions "https://raw.githubusercontent.com/zsh-users/zsh-completions/master/src/$filename"
    fi
done

unset filename
unset EXCLUDES
