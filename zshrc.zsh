source ~/.config/zshconfig/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zshconfig/z/z.sh
source ~/.config/zshconfig/zsh-git-prompt/zshrc.sh
# source ~/.config/zshconfig/ls/ls.plugin.zsh
source ~/.config/zshconfig/zpm/zpm.zsh 
PROMPT='%B%m%~%b$(git_super_status) %# '


zpm load zpm-zsh/ls
zpm load zpm-zsh/dircolors-material
zpm load zpm-zsh/title
zpm load zpm-zsh/ssh


PROMPT_TITLE='$USER@$HOST:$PWD'

### keybindings
bindkey '^[[1;5C' vi-forward-blank-word
bindkey '^[[1;5D' vi-backward-blank-word
