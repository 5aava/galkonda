# IT IS NECESSARY TO PASS

https://xakep.ru/2025/04/21/htb-administrator/
https://xakep.ru/2025/04/28/htb-vintage/
https://xakep.ru/2025/04/07/htb-ghost/
https://xakep.ru/2025/03/17/htb-certified/
https://xakep.ru/2025/02/17/htb-cicada/
https://xakep.ru/2024/12/16/htb-compiled/
https://xakep.ru/2025/05/26/htb-escapetwo/
https://xakep.ru/2025/06/16/htb-infiltrator/


===============================================================

# READ IT

## HEAL
https://xakep.ru/2025/05/19/htb-heal/

- 22 ssh
- 80 nginx

10.10.11.46 heal.htb api.heal.htb take-survey.heal.htb

LimeSurvey, LFI
LPE - consul 8500


## UnderPass 
https://xakep.ru/2025/05/12/htb-underpass/

- 22 — служ­ба OpenSSH 8.9p1;
- 80 — веб‑сер­вер Apache 2.4.52.

UDP
- 161 SNMP 

10.10.11.48    underpass.htb
daloradius

LPE - sudoers mosh-server

## BigBang
https://xakep.ru/2025/05/05/htb-bigbang/

- 22 — служ­ба OpenSSH 8.9p1;
- 80 — веб‑сер­вер Apache 2.4.62.

10.10.11.52 bigbang.htb blog.bigbang.htb app.bigbang.htb

WordPress
wpscan --url http://blog.bigbang.htb/ -e ap --plugins-detection aggressive -t 128
wpscan --api-token K.....w --url http://blog.bigbang.htb/ -e vp -t 128

BuddyForms
CVE-2024-2961 iconv glibc

LPE - mobSF chmod 4777 /bin/bash

===============================================================

# PASSED

## HTB sSUPPORT

https://xakep.ru/2022/12/19/htb-support/


53 — служ­ба DNS;
88 — служ­ба Kerberos;
135 — служ­ба уда­лен­ного вызова про­цедур (Microsoft RPC). Исполь­зует­ся для опе­раций вза­имо­дей­ствия кон­трол­лер — кон­трол­лер и кон­трол­лер — кли­ент;
139 — служ­ба сеан­сов NetBIOS, NetLogon;
389 — служ­ба LDAP;
445 — служ­ба SMB;
464 — служ­ба сме­ны пароля Kerberos;
593 (HTTP-RPC-EPMAP) — исполь­зует­ся в служ­бах DCOM и MS Exchange;
636 — LDAP с шиф­ровани­ем SSL или TLS;
3269 (LDAPS) — для дос­тупа к Global Catalog от кли­ента к кон­трол­леру через защищен­ное соеди­нение;
5985 — служ­ба уда­лен­ного управле­ния WinRM;
9389 — веб‑служ­бы AD DS.

10.10.11.174    support.htb

UserInfo.exe.zip
https://github.com/dnSpy/dnSpy
LDAP user info dump
evil-winrm -i 10.10.11.174 -u support
LPE - BloodHound