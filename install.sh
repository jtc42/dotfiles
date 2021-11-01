sh -c "$(curl -fsSL https://starship.rs/install.sh)"
mkdir -p $HOME/.zsh
curl -L git.io/antigen > $HOME/.zsh/antigen.zsh

ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.zprofile ~/.zprofile
