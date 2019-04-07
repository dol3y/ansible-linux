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
export NNN_USE_EDITOR=1
export NNN_BMS="d:$HOME/Dropbox;s:$HOME/src"
export NNN_SCRIPT="$HOME/Dropbox/share/bin"
export NNN_NOTE="$HOME/Dropbox/share/notes.md"

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

if [ -d $HOME/.local/bin ]; then
  PATH="$HOME/.local/bin:$PATH"
fi

if [ -d $HOME/bin ]; then
  PATH="$HOME/bin:$PATH"
fi

export PATH=$(printf %s "$PATH" | deduplicate.awk)

#if [ ! -z ${XDG_CURRENT_DESKTOP+x} ] && [ $XDG_CURRENT_DESKTOP == 'i3' ]; then
#    "$HOME/bin/keychainctl" start
#    source "$HOME/.keychain/$(hostname -s)-sh"
#fi

# WSL specific settings
if (uname -r | grep -q Microsoft); then
  # WSL creates everything as 777! Workaround.
  umask 022
  export DISPLAY=:0
  export DOCKER_HOST=tcp://127.0.0.1:2375
  alias cdw="cd /mnt/c/Users/$USER"
fi
