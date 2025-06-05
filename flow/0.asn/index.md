# ASN

# install

get API key - https://cloud.projectdiscovery.io/?ref=api_key
API KEY = 2cfe4fb0-0632-403f-8e1e-952398ad1d49

go install -v github.com/tomnomnom/anew@latest
go install github.com/projectdiscovery/asnmap/cmd/asnmap@latest

cd ./go/bin/

## BGP

https://bgp.he.net/dns/example.com#_ipinfo

https://bgp.he.net/ip/111.111.111.1

https://bgp.he.net/AS11111#_prefixes


## Ripe

https://apps.db.ripe.net/db-web-ui/query?bflag=false&dflag=false&rflag=true&searchtext=ngenix.net&source=RIPE


# ASNmap

https://github.com/projectdiscovery/asnmap

```sh
asnmap -a AS11111 -v | anew subnet.txt
nmap -sL -n -iL subnet.txt | awk '/Nmap scan report/{print $NF}' | grep -E "^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$" > ip_list.txt
```

