source ~/.config/zshconfig/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zshconfig/z/z.sh
# source ~/.config/zshconfig/ls/ls.plugin.zsh
source ~/.config/zshconfig/zpm/zpm.zsh 

fpath=(~/.config/zshconfig/zsh-completions/src $fpath)
fpath=(~/.config/zfunctions $fpath)

zpm load mafredri/zsh-async  
zpm load sindresorhus/pure 
zpm load zpm-zsh/ls
zpm load zpm-zsh/dircolors-material
zpm load zpm-zsh/title
zpm load zpm-zsh/ssh
zpm load zsh-users/zsh-syntax-highlighting
zpm load paraqles/zsh-plugin-ssh
zpm load chrissicool/zsh-256color
PROMPT_TITLE='$USER@$HOST:$PWD'

### keybindings
bindkey '^[[1;5C' vi-forward-blank-word
bindkey '^[[1;5D' vi-backward-blank-word


LS_COMMON="$LS_COMMON -I NTUSER.DAT\* -I ntuser.dat\*"
LS_COMMON="$LS_COMMON -I ntuser.ini"

test -n "$LS_COMMON" &&
alias ls="ls $LS_COMMON"
# POWERLEVEL9K_MODE='awesome-fontconfig'
source /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme

# zplug carloscuesta/materialshell, use:materialshell, from:github, as:theme
