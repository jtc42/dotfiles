#!/bin/bash

SCRIPT_DIR=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
echo $SCRIPT_DIR

if ! command -v starship &> /dev/null; then
  sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- -y
fi

mkdir -p $HOME/.zsh

if ! command -v antigen &> /dev/null; then
  curl -L git.io/antigen > $HOME/.zsh/antigen.zsh
fi

rm ~/.zshrc
rm ~/.zshenv
rm ~/.zprofile

echo "$SCRIPT_DIR"
if ! [[ "$SCRIPT_DIR" == "$HOME" ]]; then
  ln -s "$SCRIPT_DIR/.zshrc" "$HOME/.zshrc"
  ln -s "$SCRIPT_DIR/.zshenv" "$HOME/.zshenv"
  ln -s "$SCRIPT_DIR/.zprofile" "$HOME/.zprofile"
else
  echo "Working in home directory. No need to link."
fi
