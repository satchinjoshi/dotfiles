# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="kolo"

plugins=(git composer httpie docker zsh-syntax-highlighting aws source <(kubectl completion zsh))

export PATH="$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

export EDITOR='nvim'

# Compilation flags
export ARCHFLAGS="-arch x86_64"

alias vi="nvim"
alias gstart="git init && git add --all && git commit -m \"initial commit\""
alias open="chromium --app"
[ -f ~/.alias ] && source ~/.alias

#export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

# tmux color fixes
export TERM="xterm-256color"

# Composer
export PATH="$PATH:$HOME/.config/composer/vendor/bin"

# Go
export GOPATH="$HOME/code/go"
export PATH="$PATH:$GOPATH/bin/"

#Get back to vim by ctrl-z
fancy-ctrl-z () {
    if [[ $#BUFFER -eq 0 ]]; then
        BUFFER="fg"
        zle accept-line
    else
        zle push-input
        zle clear-screen
    fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

#Ctrl-S conflict fix for vim with zsh
stty start undef
stty stop undef
setopt noflowcontrol

### Added by the Heroku Toolbelt
export PATH="$PATH:/usr/local/heroku/bin"

### rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"

### FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

### nvm
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
if output=$(which pacman); then
    if [ -f /usr/share/nvm/init-nvm.sh ]; then source /usr/share/nvm/init-nvm.sh; fi
elif output=$(which apt-get); then
    ## for ubuntu
elif output=$(which brew); then
    export NVM_DIR="$HOME/.nvm"
    . "/usr/local/opt/nvm/nvm.sh"
fi

### Elixir version manager
# test -s "$HOME/.kiex/scripts/kiex" && source "$HOME/.kiex/scripts/kiex"

### Elixir iex history
export ERL_AFLAGS="-kernel shell_history enabled"

### Cargo
export PATH="$HOME/.cargo/bin:$PATH"

if [ -z "$SSH_AUTH_SOCK" ] ; then
    eval `ssh-agent -s`
    ssh-add
fi

export PATH=$HOME/bin:$PATH

if output=$(which pacman); then
    . $HOME/.asdf/asdf.sh
    . $HOME/.asdf/completions/asdf.bash
elif output=$(which apt-get); then
    ## for ubuntu
elif output=$(which brew); then
    source /usr/local/opt/asdf/asdf.sh
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f /opt/google-cloud-sdk/path.zsh.inc ]; then source /opt/google-cloud-sdk/path.zsh.inc; fi

# The next line enables shell command completion for gcloud.
if [ -f /opt/google-cloud-sdk/completion.zsh.inc ]; then source /opt/google-cloud-sdk/completion.zsh.inc; fi

export PATH=$PATH:~/.fabric8/bin
export PATH=$HOME/bin:$PATH
source ~/bin/tmuxinator.zsh
