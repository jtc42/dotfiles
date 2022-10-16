# Shell function paths
fpath+=$HOME/.zsh

# Aliases
alias c="clear"

alias ..='cd ..'
alias ...='cd ../..'
alias cg='cd `git rev-parse --show-toplevel`'

alias ll='ls -lh -G'

alias count='find . -type f | wc -l'

alias ve='python3 -m venv ./.venv'
alias va='source ./.venv/bin/activate'

alias genpasswd='openssl rand -base64 18'

if [[ `uname` == "Darwin" ]]; then
	alias rosetta="arch -x86_64"
	alias brew64="arch -x86_64 /usr/local/bin/brew"
fi

# Useful functions

# Switch directory and list
function cl() {
    DIR="$*";
        # if no DIR given, go home
        if [ $# -lt 1 ]; then
                DIR=$HOME;
    fi;
    builtin cd "${DIR}" && \
    # use your preferred ls command
        ls -G
}

# Make directory and switch to it
md() { mkdir -p "$1"; cd "$1";}

# Make a backup copy of a directory
backup() { cp "$1"{,.bak};}

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Antigen bundles

source $HOME/.zsh/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle pip
antigen bundle command-not-found

antigen apply

# Starship prompt
eval "$(starship init zsh)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$HOME/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Immediately deactive so we have to manually active conda
conda deactivate

# Add brew to path
if [[ `uname` == "Darwin" ]]; then
    export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
fi
