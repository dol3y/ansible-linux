# This file is managed by Ansible.
# Do NOT modify this file directly.

function current_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(git rev-parse --short HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ap='ansible-playbook'
alias aws-okta='aws-okta -b secret-service'
alias bc='bc -l'
alias be='bundle exec '
alias chrome='/usr/bin/google-chrome --user-data-dir=$HOME/.config/google-chrome &>/dev/null &'
alias cp='cp -i'
alias df='df -H'
alias du='du -ch'
alias egrep='egrep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias fgrep='fgrep --color=auto'
alias gba='git branch -a'
alias gcb='git checkout -b'
alias gcd='git checkout develop'
alias gcm='git checkout master'
alias gco='git checkout'
alias gdff='git diff'
alias ggc='git clone'
alias ggl='git log'
alias ggpull='git pull origin $(current_branch)'
alias ggpur='git pull --rebase origin $(current_branch)'
alias ggpush='git push origin $(current_branch)'
alias grep='grep --color=auto'
alias gss='git status -s'
alias h='history'
alias j='jobs -l'
alias mv='mv -i'
alias psh="pipenv shell"
alias tree='tree -C'
alias vdest='vagrant destroy -f'
alias vhalt='vagrant halt'
alias vprov='vagrant provision'
alias vreload='vagrant reload'
alias vssh='vagrant ssh'
alias vup='vagrant up'
alias wget='wget -c'

if ls --color &> /dev/null ; then
    alias l='ls -lF --color=auto'
    alias lr='ls -lr --color=auto'
    alias ls='ls -GF --color=auto'
    alias ll='ls -alF --color=auto'
    alias la='ls -Ah --color=auto'
fi

if [ -e /etc/debian_version ]; then
  # force 256 colours
  alias tmux='tmux -2'
fi
