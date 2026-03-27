alias ml='less +G /home/pi/monit/monit.log'
alias ms='monit summary'
alias tf='tail -f '
alias p='ps -fupi'
alias px='ps awx'
alias lr='ls -ltr'
alias ll='ls -la'
alias l='ls -l'
alias lg='less +G'
alias ..="cd .."
alias log="less +G /var/log/z-way-server.log"
alias h="fc -l"
alias hh="fc -l -50"
alias hhh="fc -l -999"

hgrep ()
{
    grep -i "$1" ${2:-~/.bash_history*}
}
