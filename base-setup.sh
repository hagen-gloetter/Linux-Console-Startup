#! /bin/bash
echo "pi  ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/casper
echo "hagen  ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/casper

sudo apt update
sudo apt upgrade
sudo apt install net-tools colordiff figlet toilet git 
git clone https://github.com/hagen-gloetter/Linux-Console-Startup.git
cat Linux-Console-Startup/bash.bashrc >> /etc/bash.bashrc
mkdir .ssh
cd .ssh
scp hagen@dg7shg.de:~/.ssh/authorized_keys .

adduser pi