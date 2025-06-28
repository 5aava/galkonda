# proxychains

proxychains.conf
--------------------------------------------------------
[ProxyList]
socks5	192.168.67.78	1080	lamer	secret
--------------------------------------------------------

# usage
```sh
# linux
proxychains curl https://ifconfig.me

# windows - https://github.com/shunf4/proxychains-windows/releases
.\proxychains_win32_x64.exe -f .\proxychains.conf curl https://ifconfig.io