# Windows Sort Uniq

```powershell

# Windows Sort Uniq
Get-Content 4.all_subdomains.txt | Sort-Object { $_.ToLower() } | Get-Unique | Set-Content sorted_unique_subdomains.txt

# crt.sh
jq -r '.[].name_value' .\t.json | sort -u