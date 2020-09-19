source ${XDG_CONFIG_HOME}/zshconfig/zsh-autosuggestions/zsh-autosuggestions.zsh
source ${XDG_CONFIG_HOME}/zshconfig/z/z.sh
# source ${XDG_CONFIG_HOME}/zshconfig/ls/ls.plugin.zsh
# source ${XDG_CONFIG_HOME}/zshconfig/zpm/zpm.zsh 
if [[ ! -f ${XDG_CONFIG_HOME}/.zpm/zpm.zsh ]]; then
  git clone https://github.com/zpm-zsh/zpm ${XDG_CONFIG_HOME}/.zpm
fi
source ${XDG_CONFIG_HOME}/.zpm/zpm.zsh

fpath=(${XDG_CONFIG_HOME}/zshconfig/zsh-completions/src $fpath)
fpath=(${XDG_CONFIG_HOME}/zfunctions $fpath)
fpath=(/usr/local/share/zsh/site-functions $fpath)

PATH="/usr/local/opt/gnu-getopt/bin:/usr/local/opt/coreutils/libexec/gnubin:$PATH"

### Core
zpm if ssh     \
    zpm-zsh/tmux


zpm if-not ssh            \
  zpm-zsh/tmux,apply:path \


### Compatibility
zpm if termux          \
    zpm-zsh/termux,async \


### 3party plugins
zpm                                                \
  zpm-zsh/core-config                              \
  zpm-zsh/ignored-users,async                      \
  zpm-zsh/check-deps                               \
  zpm-zsh/minimal-theme                            \
  zpm-zsh/ls,async                                 \
  zpm-zsh/colorize,async                           \
  zpm-zsh/ssh,async                                \
  zpm-zsh/dot,async                                \
  zpm-zsh/dircolors-material,async                 \
  zpm-zsh/undollar,async                           \
  zsh-users/zsh-completions,apply:fpath,fpath:/src \


zpm if-not ssh                                                                         \
  zpm-zsh/dropbox,async                                                                \
  lukechilds/zsh-better-npm-completion,async                                           \
  tj/git-extras,source:/etc/git-extras-completion.zsh,async                            \
  horosgrisa/utils,apply:path                                                          \
                                                                                       \
  zpm-zsh/readers,async                                                                \
  zpm-zsh/clipboard,async                                                              \
  zpm-zsh/mysql-colorize,async                                                         \
  zpm-zsh/zshmarks,async                                                               \
  voronkovich/gitignore.plugin.zsh,async                                               \
  zpm-zsh/autoenv,async                                                                \
                                                                                       \
  mdumitru/fancy-ctrl-z,async                                                          \
  hlissner/zsh-autopair,async                                                          \
  zthxxx/zsh-history-enquirer,async                                                    \
  zsh-users/zsh-history-substring-search,source:zsh-history-substring-search.zsh,async \
  zdharma/fast-syntax-highlighting,async                                               \
  horosgrisa/zsh-autosuggestions,source:zsh-autosuggestions.zsh,async                  \


zpm                           \
  omz/pip,async               \
  omz/extract,async           \
  omz/command-not-found,async \
  omz/wp-cli,async            \

  

source ${XDG_CONFIG_HOME}/zshconfig/3rd/command-not-found.sh
source ${XDG_CONFIG_HOME}/zshconfig/zgen/zgen.zsh

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
# source ${XDG_CONFIG_HOME}/zshconfig/powerlevel9k/powerlevel9k.zsh-theme 
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
