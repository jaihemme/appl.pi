function exitstatus {

  local EXITSTATUS="$?"
  local BOLD="\[\033[1m\]"
  local RED="\[\033[1;31m\]"
  local GREEN="\[\033[1;32m\]"
  local OFF="\[\033[m\]"
  local COLOR=$GREEN

  test $EXITSTATUS -gt 0 && COLOR=$RED
  PS1="${COLOR}${USER}@${HOST}:${PWD} (\!-$EXITSTATUS)${OFF}$ "

}
export -f exitstatus

# define my command prefix
HOST=$(hostname -s)
typeset -x exitstatus # export to other shells
export PROMPT_COMMAND="exitstatus;echo -ne \"\033]0;${USER}@${HOST}\007\""
test "$TERM" = xterm-color && export TERM=xterm

export LESSOPEN='|f="%s";[[ "$f" == *.gz ]]&&gunzip -c "$f" 2> /dev/null'
export LESSCHARSET=latin1  # muss mit LANG und Terminaleinstellung konsistent sein
export LESSCHARSET=UTF-8  # muss mit LANG und Terminaleinstellung konsistent sein
export LESS_TERMCAP_mb=$'\E[01;34m'
export LESS_TERMCAP_md=$'\E[01;34m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;41;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
export LANG=en_US.iso885915
export LANG="fr_CH.UTF-8"

# define my environment variables
export EDITOR=/usr/bin/vi
export HISTCONTROL=ignoredups
export HISTFILE=~/.bash_history_$(date +%Y%m%d)

# aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# set PATH so it includes user's private bin if it exists and current path
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
export PATH=.:$PATH

### eof ###
