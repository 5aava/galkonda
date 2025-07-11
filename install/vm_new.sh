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

# wordlists
cd ~;
git clone https://github.com/danielmiessler/SecLists.git

git clone https://github.com/projectdiscovery/fuzzing-templates

# https://wordlists.assetnote.io/


# go


# anew
go install -v github.com/tomnomnom/anew@latest

# projectdiscovery

# httpx
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest

# tlsx
go install github.com/projectdiscovery/tlsx/cmd/tlsx@latest

# naabu
apt-get install libpcap-dev
go install -v github.com/projectdiscovery/naabu/v2/cmd/naabu@latest

# subfinder
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest

# asnmap
go install github.com/projectdiscovery/asnmap/cmd/asnmap@latest

# ffuf
git clone https://github.com/ffuf/ffuf; cd ffuf; go get; go build

# searchsploit
git clone https://gitlab.com/exploit-database/exploitdb.git /opt/exploitdb
ln -sf /opt/exploitdb/searchsploit /usr/local/bin/searchsploit
