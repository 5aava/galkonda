# NMap CheatSheet

```sh
# Ralf Scan one host with all ports
echo '#!/bin/bash
ports=$(nmap -p- --min-rate=500 $1 | grep ^[0-9] | cut -d '/' -f 1 | tr "" "," | sed s/,$//)
nmap -p$ports -A $1' > mynmap.sh && chmod +x ./mynmap.sh


# scan ip all ports
nmap -p- --min-rate=500 192.168.1.1


# scan one port
nmap -p80 -A 192.168.1.1