#!/bin/sh

cd "$(dirname "$0")" || exit

# Check for Homebrew
if test ! "$(which brew)"; then
  echo "start installing homebrew."
  if test "$(uname)" = "Darwin"; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi
else
  echo "homebrew is already installed."
fi

# brew bundle
brew bundle

if test "$(which nodebrew)"; then
  echo "setup nodebrew."
  nodebrew setup_dirs
fi

exit 0
