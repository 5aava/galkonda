# clear

```sh


# ТТL 
sudo sysctl -w net.ipv4.ip_default_ttl=64       # linux
sudo sysctl -w net.ipv4.ip_default_ttl=128      # Windows


# Отключение NTP
sudo systemctl stop systemd-timesync


# Отключение ICMP Redirect
sudo sysctl -w net.ipv4.conf.all.accept_redirects=0 
sudo sysctl -w net.ipv6.conf.all.accept_redirects=0 


# Рандомизация МАС-адреса

sudo ifconfig eth0 down 
sudo macchanger -r eth0 
sudo ifconfig eth0 up

