# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="ys"

plugins=(git composer httpie vi-mode vagrant)

export PATH="$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

alias p="./vendor/bin/phpunit"
alias vi="nvim"
alias vim="nvim"

# tmux color fixes
export TERM="xterm-256color"

# Composer
export PATH="$PATH:$HOME/.composer/vendor/bin"

#PhantomJS
export PHANTOM_JS="phantomjs-1.9.8-linux-x86_64"

#GOPATH
export GOPATH="$HOME/.vagrant-golang/pkg"

#Selinium server alias
alias sserve="java -jar $HOME/.local/bin/selenium-server-standalone-2.53.0.jar"

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

### RVM
export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

### FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH=$PATH:/opt/activator

