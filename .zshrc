# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="ys"

plugins=(git composer httpie vi-mode emacs docker)

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

alias pserve="xdg-open http://localhost:8080 >> /dev/null 2>&1 && php -S localhost:8080"
alias lserve="xdg-open http://localhost:8000 >> /dev/null 2>&1 && php artisan serve"
alias pt="./vendor/bin/phpunit"
alias vi="nvim"
alias sip="$HOME/Dropbox/code/setproxy.sh"
alias artisan="php artisan"
alias tt="ctags -R --fields=+aimS --languages=php"
alias csf="php-cs-fixer --verbose fix --config-file=.php_cs"
alias emacs="emacs -nw"
alias mpv="ssh root@pagevamp.com tail -f /var/log/httpd/pagevamp.com-access.log | logstalgia --sync"
alias mapi="ssh root@api.pagevamp.com tail -f /var/log/nginx/ssl_api.pagevamp.com | logstalgia --sync"
alias mapi="ssh root@build.pagevamp.com tail -f /var/log/nginx/ssl_api.pagevamp.com | logstalgia --sync"
# tmux color fixes
export TERM="xterm-256color"
#export TERM=screen-256color-bce

# Composer
# export PATH="$PATH:$HOME/.composer/vendor/bin"
export PATH="$PATH:$HOME/.config/composer/vendor/bin"

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

## Play Framework
export PATH=$PATH:/opt/activator

eval $(thefuck --alias)


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

## Cask
export PATH="$HOME/.cask/bin:$PATH"

# Setting ag as the default source for fzf
#export FZF_DEFAULT_COMMAND='ag -g ""'

[ -f $HOME/Code/spark-installer ] && source "$HOME/Code/spark-installer/spark"
