# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

export PATH="$PATH:/opt/homebrew/bin"

ZSH_THEME="kolo"
#ZSH_THEME="kolosac"

# plugins=(git helm kubectl composer httpie colorize docker brew osx aws kubectl)
# plugins=(git helm kubectl composer httpie colorize docker brew osx aws kubectl)
plugins=(git helm kubectl composer httpie colorize docker brew macos aws kubectl gcloud)

export PATH="$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

export EDITOR='nvim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

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

### FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

### Elixir iex history
export ERL_AFLAGS="-kernel shell_history enabled"

### Cargo
export PATH="$HOME/.cargo/bin:$PATH"
source $HOME/.cargo/env

# . $HOME/.asdf/asdf.sh
# . $HOME/.asdf/completions/asdf.bash

export PATH=$PATH:~/.fabric8/bin
export PATH=$HOME/bin:$PATH
# source ~/bin/tmuxinator.zsh
export PATH="/usr/local/opt/sqlite/bin:$PATH"

alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

#source $ZSH_CUSTOM/plugins/nix-shell/nix-shell.plugin.zsh
#export NIX_PATH=$HOME/.nix-defexpr/channels${NIX_PATH:+:}$NIX_PATH

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH=$HOME/.local/bin:$PATH

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -F /usr/local/bin/aliyun aliyun

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# tabtab source for packages
# uninstall by removing these lines
# [[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true

#export CLOUDSDK_PYTHON=/usr/bin/python
if [ -e /Users/sachinjoshi/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/sachinjoshi/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

eval "$(direnv hook zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

complete -o nospace -C /usr/local/bin/vault vault

export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
export PATH="/usr/local/opt/ruby/bin:$PATH"

if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

    autoload -Uz compinit
    compinit
fi

# . /opt/homebrew/opt/asdf/asdf.sh

if [ -d "/opt/homebrew/opt/ruby/bin" ]; then
  export PATH=/opt/homebrew/opt/ruby/bin:$PATH
  export PATH=`gem environment gemdir`/bin:$PATH
fi

ZSH_CUSTOM=$HOME/.config/oh-my-zsh
