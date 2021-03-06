# If not running interactively, don't do anything
#
[[ "$-" != *i* ]] && return

# enable bash auto-completion for apt-get
#
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi

# Make bash append rather than overwrite the history on disk
#
shopt -s histappend
HISTCONTROL=ignoredups:ignorespace
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s checkwinsize

set -o vi

#PS1='\n\[\033[01;34m\]\w\[\033[00m\]\n\$ '
#PS1='\n\[\033[01;34m\]\w\[\033[00m\]\n\u@\h \$ '
PS1='\n\u@\h \[\033[01;34m\]\w\[\033[00m\]\n\$ '
if [ ${UID} -eq 0 ]; then
  PS1='\n\[\033[00;05m\]\u\[\033[00m\]@\h \[\033[01;34m\]\w\[\033[00m\]\n\$ '
fi

# aliases
#

alias df='df -h'
alias du='du -h'
alias grep='grep -i --color'                  # show differences in colour
alias egrep='egrep --color=auto'              # show differences in colour
alias fgrep='fgrep --color=auto'              # show differences in colour

alias cls='clear; ls'
alias ls='ls -hF --color=tty'                 # classify files in colour
alias ll='ls -l'                              # long list
alias la='ls -A'                              # all but . and ..

alias reprise="uniq reprise.txt|xargs -I % pchan_s %"
alias reprisea="uniq reprisea.txt|xargs -I % achan_s %"

alias fehd="feh -dFSName"

export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
export LESS=' -R '
