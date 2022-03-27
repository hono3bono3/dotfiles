#!/bin/sh

# Check for Homebrew
if test ! $(which brew)
then
  echo "start installing homebrew."
  if test "$(uname)" = "Darwin"
  then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi
else
  echo "homebrew is already installed."
fi

exit 0

