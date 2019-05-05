# zgen

source "${HOME}/.zsh/zgen/zgen.zsh"
if ! zgen saved; then
  echo "Creating a zgen save"

  zgen load zsh-users/zsh-autosuggestions
  zgen load zsh-users/zsh-syntax-highlighting
  zgen oh-my-zsh plugins/history-substring-search # MUST be after zsh-syntax-highlighting
  zgen oh-my-zsh plugins/sudo
  zgen oh-my-zsh plugins/httpie
  zgen oh-my-zsh plugins/command-not-found
  zgen oh-my-zsh plugins/osx
  zgen oh-my-zsh plugins/yarn
  zgen load zsh-users/zsh-completions src
  zgen load olivierverdier/zsh-git-prompt
  zgen load chrissicool/zsh-256color
  zgen load johnhamelink/env-zsh
  zgen load theunraveler/zsh-fancy_ctrl_z

  zgen save
fi

source ~/.zsh/config.zsh
source ~/.zsh/completion.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/bindkey.zsh
source ~/.zsh/prompt.zsh

if [ -f ~/.zshrc.local ]; then
  source ~/.zshrc.local
fi

if [ -f /usr/bin/screenfetch ]; then screenfetch; fi

# disable flow control
stty -ixon
