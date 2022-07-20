
# past this BEHIND your existing /etc/bash.bashrc
# hg
alias tm='tail -f /var/log/messages'
alias ts='tail -f /var/log/syslog'
alias tf='tail -f '
# a better ls
alias ll="ls -l --color=auto"
alias l="ls -lha --color=auto"
alias dir="ls -lha --color=auto"
alias la="ls -la --color=auto"
alias ls="ls --color=auto"
## a quick way to get out of current directory ##
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
## ssh with x
alias ssh="ssh -X"
## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias mkdir='mkdir -pv'
alias removeemptydirs='find -type d -exec rmdir -p {} \; 2>/dev/null'
#alias tar='tar -I /usr/bin/pigz'
alias ptar='tar -I /usr/bin/pigz'
# install  colordiff package :)
alias diff='colordiff'
##Show open ports
alias ports='netstat -tulanp'
# distro specific  - Debian / Ubuntu and friends #
# install with apt-get
alias apt="sudo apt-get"
alias apt-get="sudo apt-get"
#
# update on one command
alias updatey="sudo apt-get update && sudo apt-get upgrade -y && apt-get dist-upgrade && sudo apt-get autoremove && sudo apt-get autoclean"
alias update='sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade && sudo apt-get autoremove && sudo apt-get autoclean'
# reboot / halt / poweroff
alias reboot='sudo /sbin/reboot'
## apache
alias apache='/etc/init.d/apache2'
## pass options to free ##
alias meminfo='free -m -l -t'
## this one saved by butt so many times ##
alias wget='wget -c'
#alias kernel_remover=dpkg -l 'linux-*' |  sed '/^ii/!d;/'"$(uname -r |  sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' |  xargs sudo apt-get -y purge'
# a better prompt
export PS1="\[\033[01;37m\]\$? \$(if [[ \$? == 0 ]]; then echo \"\[\033[01;32m\]:)\"; else echo \"\[\033[01;31m\]:(\"; fi) $(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]\h'; else echo '\[\033[01;32m\]\u@\h:'; fi)\[\033[01;33m\]\w \$\[\033[00m\] "
xhost +
figlet $HOSTNAME

# BEGIN ANSIBLE MANAGED BLOCK
# hg
alias tm='tail -f /var/log/messages'
alias ts='tail -f /var/log/syslog'
alias tf='tail -f '
# a better ls
alias ll="ls -l --color=auto"
alias l="ls -lha --color=auto"
alias dir="ls -lha --color=auto"
alias la="ls -la --color=auto"
alias ls="ls --color=auto"
## a quick way to get out of current directory ##
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
## ssh with x
alias ssh="ssh -X"
## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias mkdir='mkdir -pv'
alias removeemptydirs='find -type d -exec rmdir -p {} \; 2>/dev/null'
#alias tar='tar -I /usr/bin/pigz'
alias ptar='tar -I /usr/bin/pigz'
# install  colordiff package :)
alias diff='colordiff'
##Show open ports
alias ports='netstat -tulanp'
# distro specific  - Debian / Ubuntu and friends #
# install with apt-get
alias apt="sudo apt-get"
alias apt-get="sudo apt-get"
#
# update on one command
alias updatey="sudo apt-get update && sudo apt-get upgrade -y && apt-get dist-upgrade && sudo apt-get autoremove && sudo apt-get autoclean"
alias update='sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get dist-upgrade && sudo apt-get autoremove && sudo apt-get autoclean'
alias updatedist='do-release-upgrade'
# reboot / halt / poweroff
alias reboot='sudo /sbin/reboot'
## apache
alias apache='/etc/init.d/apache2'
## pass options to free ##
alias meminfo='free -m -l -t'
## this one saved by butt so many times ##
alias wget='wget -c'
#alias kernel_remover=dpkg -l 'linux-*' |  sed '/^ii/!d;/'"$(uname -r |  sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' |  xargs sudo apt-get -y purge'
# a better prompt
#export PS1="\[\033[01;37m\]\$? \$(if [[ \$? == 0 ]]; then echo \"\[\033[01;32m\]:)\"; else echo \"\[\033[01;31m\]:(\"; fi) $(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]\h'; else echo '\[\033[01;32m\]\u@\h'; fi)\[\033[01;33m\] \w \$\[\033[00m\] "
export PS1="\[\033[01;37m\]\$? \$(if [[ \$? == 0 ]]; then echo \"\[\033[01;32m\]:)\"; else echo \"\[\033[01;31m\]:(\"; fi) $(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]\h'; else echo '\[\033[01;32m\]\u@\h:'; fi)\[\033[01;33m\]\w \$\[\033[00m\] "

# needs a workover

#!/bin/sh

# Variables
HOSTNAME=$(uname -n)
KERNEL=$(uname -r)
UPTIME_DAYS=$(expr $(cat /proc/uptime | cut -d '.' -f1) % 31556926 / 86400)
UPTIME_HOURS=$(expr $(cat /proc/uptime | cut -d '.' -f1) % 31556926 % 86400 / 3600)
UPTIME_MINUTES=$(expr $(cat /proc/uptime | cut -d '.' -f1) % 31556926 % 86400 % 3600 / 60)
# The different colours as variables
W="\033[01;37m"   # white
G="\033[01;32m"   # green
Y="\033[01;33m"   # yellow
B="\033[01;34m"   # blue
L="\033[01;36m"   # light blue
R="\033[01;31m"   # red
X="\033[00;37m"   # default
FIGLETFONT="mini" # mini or small
PIMODELFQFN="/sys/firmware/devicetree/base/model"
#IP=`ifconfig | grep -e "inet addr" -e "inet" | grep -v inet6 | grep -v 127 | cut -d " " -f10`
#IP1=`echo $IP | cut -d " " -f1`
#IP2=`echo $IP | cut -d " " -f2`
IP1=$(hostname -I | cut -d "f" -f1)
IP2=""
# Start of code

echo -e "$B"
echo -e "================================================="
echo -e "$Y"
figlet $HOSTNAME
echo -e "$B"
echo -e "================================================="
if [ -e $PIMODELFQFN ]; then
    echo -e -n "$L"
    #    cat $PIMODELFQFN | figlet  -f $FIGLETFONT
    cat $PIMODELFQFN
    echo
    echo -e -n "$B"
    echo -e "================================================="
else
    # Output other Achitecture
    echo -e ""
fi
#echo -e  "$B IP:       $G $IP1    $L $IP2"
#echo -e  -n "$B"
#echo -e  "================================================="
echo -e "$B User:     $R $USER"
echo -e "$B Hostame:  $R $HOSTNAME "
echo -e "$B Linux:    $R $(lsb_release -s -d) with $(uname -r)"
echo -e -n "$B"
echo -e "================================================="
echo -e "$B Uptime:   $R $UPTIME_DAYS days, $UPTIME_HOURS hours, $UPTIME_MINUTES minutes"
echo -e -n "$B"

cat <<EOF
=================================================
 CPU:   $(cat /proc/cpuinfo | grep 'model name' | head -1 | cut -d':' -f2)
 CPU Load:    $(cat /proc/loadavg | awk '{print $1 ", " $2 ", " $3}')
 Memory: $(free -m | head -n 2 | tail -n 1 | awk {'print $2'})M
 Free Memory: $(free -m | head -n 2 | tail -n 1 | awk {'print $4'})M
 Free Swap:   $(free -m | tail -n 1 | awk {'print $4'})M
 Free Disk:   $(df -h / | awk '{ a = $2 } END { print a }')
=================================================
EOF
if [ -e $PIMODELFQFN ]; then
    sleep 1
    IP1=$(hostname -I | cut -d "f" -f1)
fi
echo -e "$B IP:       $G $IP1    $L $IP2"
echo -e -n "$B"
echo -e "================================================="
echo -e "$X"
# END ANSIBLE MANAGED BLOCK
