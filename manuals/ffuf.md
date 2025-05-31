# By Ralf
```sh
ffuf -u 'http://example.com' -t 256 -w ./SecLists/Discovery/DNS/subdomains-top1million-110000.txt -H 'Host: FUZZ.example.com' 
```