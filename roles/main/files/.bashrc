# This file is managed by Ansible.
# Do NOT modify this file directly.

# source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# source company specific definitions
if [ -f ~/.bash_addons ]; then
  . ~/.bash_addons
fi

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTSIZE=32769
export HISTCONTROL=ignoredups:erasedups

export EDITOR="vim"

# alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

black='\e[0;30m'
red='\e[0;31m'
green='\e[0;32m'
yellow='\e[0;33m'
blue='\e[0;34m'
purple='\e[0;35m'
cyan='\e[0;36m'
white='\e[0;37m'

if which rbenv &> /dev/null; then
    eval "$(rbenv init -)"
fi

# mac_os_x
if [ -e /usr/bin/sw_vers ]; then
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
      . $(brew --prefix)/etc/bash_completion
  fi

  if which jenv &> /dev/null; then
    eval "$(jenv init -)"
  fi
  export JENV_ROOT=/usr/local/opt/jenv

  PATH=$PATH:/usr/local/opt/go/libexec/bin
  PATH=$PATH:/usr/local/opt/jenv/bin

  export NODE_PATH=/usr/local/lib/node_modules

  # fix duplicate PATH entries in tmux
  eval $(/usr/libexec/path_helper -s)
fi

# rhel/centos
if [ -e /etc/redhat-release ]; then
  . /usr/share/git-core/contrib/completion/git-prompt.sh
fi

# debian/ubuntu
if [ -e /etc/debian_version ]; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
      . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
      . /etc/bash_completion
  fi
fi

export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWSTASHSTATE=true

PS1="\[$green\]\u@\h\[\e[m\]:\[$cyan\]\W\[\e[m\]\[$red\]\$(__git_ps1 ' [%s]')\[\e[m\]\n\$ "

export PATH="$HOME/bin:$PATH"
if [ -d $HOME/.local/bin ]; then
  export PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi

if which pyenv &> /dev/null; then
  export PATH="$HOME/.pyenv/bin:$PATH"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

if [ ! -z ${XDG_CURRENT_DESKTOP+x} ] && [ $XDG_CURRENT_DESKTOP == 'i3' ]; then
    "$HOME/bin/keychainctl" start
    source "$HOME/.keychain/$(hostname -s)-sh"
fi
