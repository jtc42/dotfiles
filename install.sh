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

ln -s "$SCRIPT_DIR/.zshrc" ~/.zshrc
ln -s "$SCRIPT_DIR/.zshenv" ~/.zshenv
ln -s "$SCRIPT_DIR/.zprofile" ~/.zprofile
