# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private local bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Add brew to path if it's installed
if [[ -d "/opt/homebrew"  ]]; then
    export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
fi

# Add poetry to path if it's installed
if [ -d "HOME/.poetry/bin" ] ; then
    PATH="$HOME/.poetry/bin:$PATH"
fi
