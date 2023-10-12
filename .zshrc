# Shell function paths
fpath+=$HOME/.zsh

# Basic configuration

## Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Aliases
alias c="clear"

## Directory navigation
alias ..='cd ..'
alias ...='cd ../..'
alias cg='cd `git rev-parse --show-toplevel`'
alias ll='ls -lh -G'
alias count='find . -type f | wc -l'

## Python environments
alias ve='python3 -m venv ./.venv'
alias va='source ./.venv/bin/activate'

## Utilities
alias genpasswd='openssl rand -base64 18'
alias qr-decode='zbarimg --nodbus'

## MacOS Rosetta
if [[ `uname` == "Darwin" ]]; then
	alias rosetta="arch -x86_64"
	alias brew64="arch -x86_64 /usr/local/bin/brew"
fi

# Useful functions

## Switch directory and list
function cl() {
    DIR="$*";
        # if no DIR given, go home
        if [ $# -lt 1 ]; then
                DIR=$HOME;
    fi;
    builtin cd "${DIR}" && \
        ls -G
}

## Make directory and switch to it
md() { mkdir -p "$1"; cd "$1";}

## Make a backup copy of a directory
backup() { cp "$1"{,.bak};}

# Antigen bundles

source $HOME/.zsh/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle pip
antigen bundle command-not-found

antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

antigen apply

# Starship prompt
eval "$(starship init zsh)"

# Conda

## >>> conda initialize >>>
## !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$HOME/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/miniconda3/etc/profile.d/conda.sh"
        # Immediately deactive so we have to manually active conda
        conda deactivate
    else
        export PATH="$HOME/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Add brew to path
if [[ `uname` == "Darwin" ]]; then
    export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
fi

# Configure NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Configure SDKMAN
## THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
if [[ -d "$SDKMAN_DIR"  ]]; then
    [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
fi
