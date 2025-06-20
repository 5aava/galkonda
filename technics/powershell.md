# System info commands

```powershell

# all system info
systeminfo
ipconfig /all
net user
Get-WmiObject Win32_ComputerSystem
Get-Service
Get-WmiObject Win32_VideoController
Get-CimInstance Win32_LogicalDisk -Filter "DriveType=3" | Select-Object `DeviceID, @{Name="Size(GB)";Expression={"{0:N2}" -f ($_.Size / 1GB)}}, @{Name="Free(GB)";Expression={"{0:N2}" -f ($_.FreeSpace / 1GB)}},@{Name="Used(GB)";Expression={"{0:N2}" -f (($_.Size - $_.FreeSpace) / 1GB)}}
