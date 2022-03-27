#!/bin/sh

cd "$(dirname "$0")" || exit

brew bundle dump --force

exit 0
