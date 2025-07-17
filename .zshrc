# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

export PATH="$PATH:/opt/homebrew/bin"

ZSH_THEME="kolo"
#ZSH_THEME="kolosac"

plugins=(git helm kubectl composer httpie colorize docker brew macos aws kubectl gcloud)

export PATH="$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

export EDITOR='nvim'

alias vi="nvim"

[ -f ~/.alias ] && source ~/.alias

# Go
export GOPATH="$HOME/code/go"
export PATH="$PATH:$GOPATH/bin"

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

### FZF key bindings
source <(fzf --zsh)

### Elixir iex history
export ERL_AFLAGS="-kernel shell_history enabled"

### Cargo
export PATH="$HOME/.cargo/bin:$PATH"
source $HOME/.cargo/env

export PATH=$HOME/bin:$PATH

alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

export PATH=$HOME/.local/bin:$PATH

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -F /usr/local/bin/aliyun aliyun

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

eval "$(direnv hook zsh)"

complete -o nospace -C /opt/homebrew/bin/vault vault

export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

ZSH_CUSTOM=$HOME/.config/oh-my-zsh
