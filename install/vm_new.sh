#!/bin/bash

# install new VM

apt update -y
apt upgrade -y
apt install -y git curl mc tmux

## apache
apt install apache2 -y

## python
apt install python2.7 -y
apt install python3-pip -y
apt install python3-virtualenv -y

## sqlmap
snap install sqlmap

## ruby nikto nmap
apt install nmap nikto ruby-full -y

# wpscan
gem install wpscan

# wordlist
cd ~;
git clone https://github.com/danielmiessler/SecLists.git

