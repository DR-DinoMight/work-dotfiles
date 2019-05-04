#!/bin/bash

set +e

# Fetch the code from the other Git repos like zsh-git-prompt, Vim vundle...
git submodule update --remote --init

# Create the symlinks in $HOME
function link_if_missing() {
  SRC=$1
  DEST=$2

  if ! [ -L $DEST ]; then
    ln -ivs $SRC $DEST
  else
    echo "Skipping, link already exists: $DEST"
  fi
}

link_if_missing $PWD/bin                    $HOME/bin
link_if_missing $PWD/zsh                    $HOME/.zsh
link_if_missing $PWD/zshrc                  $HOME/.zshrc
