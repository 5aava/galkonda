# Windows Sort Uniq

```powershell

# Windows Sort Uniq
Get-Content 4.all_subdomains.txt | Sort-Object { $_.ToLower() } | Get-Unique | Set-Content 5.sorted_unique_subdomains.txt

# Linux Sort uniq
cat 4.all_subdomains.txt | sort -u > 5.sorted_unique_subdomains.txt
