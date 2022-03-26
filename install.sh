#!/usr/bin/env bash

set -u

BASEDIR=$(dirname $0)
cd $BASEDIR

echo $BASEDIR

for f in .??*; do
    [ "$f" = ".git" ] && continue
    [ "$f" = ".gitconfig.local.template" ] && continue
    [ "$f" = ".gitmodules" ] && continue

    ln -snfv ${PWD}/"$f" ~/
done
