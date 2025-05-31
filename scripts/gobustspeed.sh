#!/bin/bash
DOMAIN=example.com
NS_SERVER=8.8.8.8
_WORDLIST=/root/SecLists/Discovery/DNS/subdomains-top1million-110000.txt # biggest
WORDLIST=/root/SecLists/Discovery/DNS/subdomains-top1million-5000.txt # smallest
OUTPUT_DIR_NAME=/root/subdomains/$DOMAIN


# install soft
git clone https://github.com/danielmiessler/SecLists.git
apt install gobuster -y

# make dirs
if [ ! -d "/root/subdomains" ]; then mkdir "/root/subdomains"; fi;
if [ ! -d "$OUTPUT_DIR_NAME" ]; then mkdir $OUTPUT_DIR_NAME; fi;

# run gobuster
CMD="gobuster -m dns -u $DOMAIN -i -t 50 -w $WORDLIST -o ./test.txt"

echo "================================================================="
echo $CMD
echo "================================================================="
$CMD
