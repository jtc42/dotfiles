if ! command -v starship &> /dev/null; then
  sh -c "$(curl -fsSL https://starship.rs/install.sh)"
fi

mkdir -p $HOME/.zsh

if ! command -v antigen &> /dev/null; then
  curl -L git.io/antigen > $HOME/.zsh/antigen.zsh
fi

ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.zshenv ~/.zshenv
ln -s ~/dotfiles/.zprofile ~/.zprofile
