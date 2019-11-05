# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="kolo"

plugins=(git helm kubectl composer httpie colorize docker brew osx aws kubectl)

export PATH="$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

export EDITOR='nvim'

# Compilation flags
export ARCHFLAGS="-arch x86_64"

alias vi="nvim"

[ -f ~/.alias ] && source ~/.alias

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

### FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

### Elixir iex history
export ERL_AFLAGS="-kernel shell_history enabled"

### Cargo
export PATH="$HOME/.cargo/bin:$PATH"

if [ -z "$SSH_AUTH_SOCK" ] ; then
    eval `ssh-agent -s`
    ssh-add
fi

if output=$(which pacman); then
    . $HOME/.asdf/asdf.sh
    . $HOME/.asdf/completions/asdf.bash
elif output=$(which apt-get); then
    ## for ubuntu
elif output=$(which brew); then
    . $HOME/.asdf/asdf.sh
    . $HOME/.asdf/completions/asdf.bash
fi

export PATH=$PATH:~/.fabric8/bin
export PATH=$HOME/bin:$PATH
source ~/bin/tmuxinator.zsh
export PATH="/usr/local/opt/sqlite/bin:$PATH"
