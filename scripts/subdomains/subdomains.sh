#!/bin/bash

DOMAIN=hackerone.com
NS_SERVER=8.8.8.8
WORDLIST=/root/SecLists/Discovery/DNS/subdomains-top1million-110000.txt
OUTPUT_DIR_NAME=/root/subdomains/$DOMAIN

export API_KEY_VIRUSTOTAL='API_KEY_VIRUSTOTAL'
export API_KEY_SHODAN='API_KEY_SHODAN'


if [ ! -d "/root/subdomains" ]; then mkdir "/root/subdomains"; fi;
if [ ! -d "$OUTPUT_DIR_NAME" ]; then mkdir $OUTPUT_DIR_NAME; fi;

# run fierce
CMD="pipx run fierce --domain $DOMAIN"

echo "================================================================="
echo $CMD
echo "================================================================="
$CMD


# run knockpy
CMD="knockpy -d $DOMAIN --recon --bruteforce"

echo "================================================================="
echo $CMD
echo "================================================================="
$CMD
