# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="ys"

plugins=(git composer httpie emacs docker)

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

### RVM
export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

### FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval $(thefuck --alias)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# if [ $TERMINIX_ID ] || [ $VTE_VERSION ]; then
    # source /etc/profile.d/vte.sh
# fi

# Elixir version manager
# [[ -s "$HOME/.kiex/scripts/kiex" ]] && source "$HOME/.kiex/scripts/kiex"

GEM_HOME=$(ls -t -U | ruby -e 'puts Gem.user_dir')
GEM_PATH=$GEM_HOME
export PATH=$PATH:$GEM_HOME/bin

if [ -z "$SSH_AUTH_SOCK" ] ; then
    eval `ssh-agent -s`
    ssh-add
fi

export PATH=$HOME/bin:$PATH

export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools

export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
export MANPATH="/home/linuxbrew/.linuxbrew/share/man:$MANPATH"
export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:$INFOPATH"

