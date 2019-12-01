source ~/.config/zshconfig/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zshconfig/z/z.sh
# source ~/.config/zshconfig/ls/ls.plugin.zsh
source ~/.config/zshconfig/zpm/zpm.zsh 

fpath=(~/.config/zshconfig/zsh-completions/src $fpath)

zpm load mafredri/zsh-async  
zpm load zpm-zsh/ls
# zpm load zpm-zsh/dircolor 
# LS_COMMON="$LS_COMMON -I NTUSER.DAT\* -I ntuser.dat\*"
# LS_COMMON="$LS_COMMON -I ntuser.ini"

# test -n "$LS_COMMON" &&
# alias ls="ls $LS_COMMON"rcolors-material
zpm load zpm-zsh/title
zpm load zpm-zsh/ssh
zpm load zsh-users/zsh-syntax-highlighting
zpm load paraqles/zsh-plugin-ssh
zpm load zpm-zsh/colors
# zpm load zpm-zsh/zsh-command-not-found

source ~/.config/zshconfig/3rd/command-not-found.sh

source "${HOME}/.config/zshconfig/zgen/zgen.zsh"

PROMPT_TITLE='$USER@$HOST:$PWD'
# export TERM=rxvt-unicode-256color

### keybindings

# bindkey '^[[1;5C' vi-forward-blank-word
# bindkey '^[[1;5D' vi-backward-blank-word

if [[ "${terminfo[khome]}" != "" ]]; then
    bindkey "${terminfo[khome]}" beginning-of-line
fi
if [[ "${terminfo[khome]}" != "" ]]; then 
    bindkey "${terminfo[kend]}" end-of-line
fi 

# LS_COMMON="$LS_COMMON -I NTUSER.DAT\* -I ntuser.dat\*"
# LS_COMMON="$LS_COMMON -I ntuser.ini"

# test -n "$LS_COMMON" &&
# alias ls="ls $LS_COMMON"
# POWERLEVEL9K_MODE='awesome-fontconfig'
# source ~/.config/zshconfig/powerlevel9k/powerlevel9k.zsh-theme 
zgen load denysdovhan/spaceship-prompt spaceship

if [ -f "$HOME/.profile" ] ; then
    source $HOME/.profile
fi

umask 022
# Emacs tramp fix
if [[ "$TERM" == "dumb" ]]
then
  unsetopt zle
  unsetopt prompt_cr
  unsetopt prompt_subst
  PS1='$ '
fi
