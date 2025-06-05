# Subdomains

1. Online Services

- https://cloud.projectdiscovery.io
- https://suip.biz/ru/?act=subfinder
- https://www.whoxy.com/
- https://securitytrails.com/

```sh
curl --request GET --url 'https://api.securitytrails.com/v1/domain/example.com/subdomains?children_only=false&include_inactive=true' --header 'accept: application/json' -H 'apikey: you_api'
```

- https://github.com/hakluke/haktrails

- https://crt.sh/

```sh
while IFS= read -r domain; do curl -s "https://crt.sh/?cn=%25.$domain&output=json" | jq -r '.[].name_value' | sort -u | anew subdomain_crtsh.txt; done < scope
```

- VirusTotal

```sh
while read -r ip_list; do vt ip resolutions "$ip" -i host_name | awk -F'"' '/host_name/ {print $2}'; sleep 15; done < ips.txt | anew subdomain_virustotal.txt

while read -r domain; do vt domain resolutions "$domain" -i ip_address | awk -F'"' '/ip_address/ {print $2}'; sleep 15; done < subdomains.txt | anew ip_list.txt
```

- Censys

```sh
(services.tls.certificate.parsed.subject.common_name="*.domain.ru" or name="*.domain.ru" or services.tls.certificates.leaf_data.issuer.common_name="*.domain.ru" or services.tls.certificates.leaf_data.subject.common_name="*.domain.ru" or services.http.response.html_title: "*.domain.ru" or services.http.response.html_tags="*.domain.ru") or services.http.response.favicons.md5_hash:your-md5-hash and not labels: truncated

location.country=`Russia` and (services.port=`8123` and services.http.response.status_code=200)
```


2. Google Dorks and Services

- https://pentest-tools.com/information-gathering/google-hacking
- https://taksec.github.io/google-dorks-bug-bounty/
- https://dorks.faisalahmed.me/
- https://nitinyadav00.github.io/Bug-Bounty-Search-Engine/

3. Google Dorks Tool

- https://github.com/RevoltSecurities/GoogleDorker
- https://github.com/cipher387/Dorks-collections-list?tab=readme-ov-file
- https://www.exploit-db.com/google-hacking-database

```sh
dorker -l queries_dork.txt | anew url_dorks.txt
dorker -q "inurl:api site:bentley.com"
cat urls_dorks.txt | grep -oP 'https://\K[^/]+' | anew subdomains_dorks
```

4. Reverse resolve IP 

https://github.com/projectdiscovery/dnsx

```sh
echo "111.111.111.0/24" | dnsx -ptr -resp | anew ptr
cat subnet | dnsx -ptr -resp | sed 's/\x1b\[[0-9;]*m//g' | awk '{print $NF}' | tr -d '[]' | anew subdomain_ptr_all.txt
cat subdomain_ptr_all.txt | rev | cut -d . -f 1,2 | rev | sort
cat subdomain_ptr_all.txt | inscope | anew subdomain_ptr.txt
```

5. SSL/TLS, TLSx — certs searchs

```sh
# TLSx
echo "111.111.111.0/24" | tlsx -p 443,3443,8443,9443,10443 -cn -san | anew tlsx
cat subnet | tlsx -p 443,3443,8443,9443,10443 -cn -san | grep -oP '\[\K[^\]]+' | anew subdomain_tlsx_all.txt
cat subdomain_tlsx_all.txt | rev | cut -d . -f 1,2 | rev | sort

# SSL/TLS
while read domain; do openssl s_client -connect "$domain:443" 2>&1 < /dev/null | openssl x509 -noout -text | grep -i dns | sed -E 's/DNS://g' | tr -d ' ' | anew subdomain_openssl.txt; done < subdomains
```

6. Amass, ASN

```sh
amass intel -asn 11111 | inscope | anew subdomain_amass.txt
```

7. Revwhois

https://github.com/Sybil-Scan/revwhoix

```sh
revwhoix -k "LLC "Roga and Kopyta"" | anew subdomain_revwhoix.txt
```

8. Subfinder

https://github.com/projectdiscovery/subfinder


9. Github Subdomains

https://github.com/gwen001/github-subdomains

```sh
github-subdomains -d example.com -t ~/.config/github_recon/.tokens -o "github_example_com.txt"
```

10. Bruteforce by wordlist

https://github.com/d3mondev/puredns


```sh
git clone https://github.com/blechschmidt/massdns.git
cd massdns
make
sudo make install

wget https://public-dns.info/nameservers-all.txt
wget https://wordlists-cdn.assetnote.io/data/manual/best-dns-wordlist.txt

puredns bruteforce best-dns-wordlist.txt domain.com
puredns bruteforce best-dns-wordlist.txt domain.com -w subdomains.txt -r nameservers-all.txt

```

Resolvers

https://public-dns.info/nameservers-all.txt


11. Permutations

https://github.com/projectdiscovery/alterx/

```sh
go install github.com/projectdiscovery/alterx/cmd/alterx@latest

cat domains.txt | alterx | dnsx -o alterx_resolved.txt

puredns resolve alterx_resolved.txt

cat alterx_resolved.txt | grep -Ev '(^|\.)image\.finance\.domain\.ru$|(^|\.)links\.news\.domain\.ru$|(^|\.)links\.domain\.ru$|(^|\.)image\.news\.domain\.ru$|(^|\.)image\.moderation\.domain\.ru$|(^|\.)image\.supplier\.domain\.ru$' | anew subdomain_brute.txt

cat subdomain_brute.txt | anew domains
sort -o domains domains
```
