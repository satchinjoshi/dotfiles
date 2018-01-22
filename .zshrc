# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="ys"
ZSH_THEME="sorin"

plugins=(git composer httpie emacs docker zsh-syntax-highlighting)

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
export GOPATH="$HOME/.go/pkg"
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

### FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

### nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

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

export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /home/sachin/.nvm/versions/node/v8.9.4/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /home/sachin/.nvm/versions/node/v8.9.4/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /home/sachin/.nvm/versions/node/v8.9.4/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /home/sachin/.nvm/versions/node/v8.9.4/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
