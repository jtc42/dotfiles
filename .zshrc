# Shell function paths
fpath+=$HOME/.zsh

# Aliases
alias npp="notepad++.exe"
alias ws="websocat"

# Antigen + oh-my-zsh
source $HOME/.zsh/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Default bundles
antigen bundle screen
antigen bundle vscode
antigen bundle git
antigen bundle pip
antigen bundle docker
antigen bundle command-not-found
antigen bundle z

# User bundles
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
#antigen bundle zsh-users/zsh-syntax-highlighting
#antigen bundle mafredri/zsh-async

# Pure prompt
# antigen bundle sindresorhus/pure

# Tell Antigen that you're done.
antigen apply

eval "$(starship init zsh)"
