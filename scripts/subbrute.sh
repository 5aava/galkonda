#!/bin/bash
DOMAIN=example.com
NS_SERVER=8.8.8.8
WORDLIST=/root/SecLists/Discovery/DNS/subdomains-top1million-110000.txt
OUTPUT_DIR_NAME=/root/subdomainbrute/$DOMAIN

if [ ! -d "/root/subdomainbrute" ]; then mkdir "/root/subdomainbrute"; fi;
if [ ! -d "$OUTPUT_DIR_NAME" ]; then mkdir $OUTPUT_DIR_NAME; fi;

# add fierce and knock

# we begining
echo "=================== $DOMAIN ======================"

# amass
echo "=================== amass ======================"
if [ ! -d "$OUTPUT_DIR_NAME/amass" ]; then mkdir $OUTPUT_DIR_NAME/amass; fi;
amass enum -d $DOMAIN | tee $OUTPUT_DIR_NAME/amass/$(date +%d.%m.%Y).txt 


# altdns
echo "=================== altdns ========================"
if [ ! -d "$OUTPUT_DIR_NAME/altdns" ]; then mkdir $OUTPUT_DIR_NAME/altdns; fi;

> $OUTPUT_DIR_NAME/altdns/$(date +%d.%m.%Y).txt
cd /root/subdomainbrute/tools/altdns/
echo $DOMAIN > subdomains.txt
#altdns -i ../../subdomains.txt -o data_output -w words.txt -r -s $OUTPUT_DIR_NAME/altdns/$(date +%d.%m.%Y).txt


# ctfr
echo "=================== ctfr ========================"
if [ ! -d "$OUTPUT_DIR_NAME/ctfr" ]; then mkdir $OUTPUT_DIR_NAME/ctfr; fi;

cd /root/subdomainbrute/tools/ctfr/
#python3 ctfr.py -d $DOMAIN | tee $OUTPUT_DIR_NAME/ctfr/$(date +%d.%m.%Y).txt


# dnscan
echo "=================== dnscan ========================"
if [ ! -d "$OUTPUT_DIR_NAME/dnscan" ]; then mkdir $OUTPUT_DIR_NAME/dnscan; fi;

cd /root/subdomainbrute/tools/dnscan/
#python3 dnscan.py -d $DOMAIN | tee $OUTPUT_DIR_NAME/dnscan/$(date +%d.%m.%Y).txt


# dnsrecon
echo "=================== dnsrecon ========================"
if [ ! -d "$OUTPUT_DIR_NAME/dnsrecon" ]; then mkdir $OUTPUT_DIR_NAME/dnsrecon; fi;

cd /root/subdomainbrute/tools/dnsrecon/
#dnsrecon -d $DOMAIN -D $WORDLIST -t brt | tee $OUTPUT_DIR_NAME/dnsrecon/$(date +%d.%m.%Y).txt


# dnssearch - go
echo "=================== dnssearch ========================"
if [ ! -d "$OUTPUT_DIR_NAME/dnssearch" ]; then mkdir $OUTPUT_DIR_NAME/dnssearch; fi;

cd /root/go/bin
#./dnssearch -domain $DOMAIN -wordlist $WORDLIST | tee $OUTPUT_DIR_NAME/dnssearch/$(date +%d.%m.%Y).txt

# gobuster - go - fasters
echo "=================== gobuster ========================"
if [ ! -d "$OUTPUT_DIR_NAME/gobuster" ]; then mkdir $OUTPUT_DIR_NAME/gobuster; fi;

gobuster -m dns -u $DOMAIN -t 50 -w $WORDLIST | tee $OUTPUT_DIR_NAME/gobuster/$(date +%d.%m.%Y).txt

# to finish
# clear rwsult
# resolve all subdomains
