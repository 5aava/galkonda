# dante install

```sh
apt install dante-server -y
useradd -r -s /bin/false userdante
passwd userdante # type password
```
# config

```sh
mkdir /home/userdante/
> /home/userdante/socks.log
mv /etc/danted.conf /etc/danted.conf.bak
mcedit /etc/danted.conf 
```

```s
logoutput: /home/userdante/socks.log
internal: eth0 port = 19191
external: eth0

clientmethod: none
socksmethod: username

user.privileged: root
user.notprivileged: nobody

client pass {
        from: 0.0.0.0/0 to: 0.0.0.0/0
        log: error connect disconnect
}
client block {
        from: 0.0.0.0/0 to: 0.0.0.0/0
        log: connect error
}
socks pass {
        from: 0.0.0.0/0 to: 0.0.0.0/0
        log: error connect disconnect
        user: userdante
}
socks block {
        from: 0.0.0.0/0 to: 0.0.0.0/0
        log: connect error
}
```
# restart on reboot

systemctl start danted; systemctl status danted

service danted restart; service danted status

# Automatic Start Danted After Reboot
systemctl enable danted


# check

curl -x socks5://userdante:password@ip:19191 ifconfig.me
