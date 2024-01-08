#!/bin/bash
#
# sokdr
#
date=$(date +%Y%m%d)
echo
path="/home/admin/Documents/log"
echo
echo "File will be saved on $path/linuxAudit_$date.txt "
touch $path/linuxAudit_$date.txt
{            
    echo "###############################################"
    echo
    echo
    sleep 3
    echo
    echo "Script Starts ;)"
    START=$(date +%s)
    echo
    echo -e "\e[0;33m 1. Linux Kernel Information////// \e[0m"
    echo
    uname -a
    echo
    echo "###############################################"
    echo
    echo -e "\e[0;33m 2.  Linux Distribution Information///// \e[0m"
    echo	
    cat /etc/redhat-release
    echo
    echo "###############################################"
    echo
    echo -e "\e[0;33m 3. List Current Logged In Users///// \e[0m"
    echo
    w
    echo
    echo "###############################################"
    echo
    echo -e "\e[0;33m 4. $HOSTNAME Uptime Information///// \e[0m"
    echo
    uptime
    echo
    echo "###############################################"
    echo
    echo -e "\e[0;33m 5. Check Available Space///// \e[0m"
    echo
    df -h
    echo
    echo "###############################################"
    echo
    echo -e "\e[0;33m 6. Check Memory///// \e[0m"
    echo
    free -h
    echo
    echo "###############################################"
    echo
    echo -e "\e[0;33m 7. Check Running Processes///// \e[0m"
    echo
    ps -a
    echo
    echo "###############################################"
    echo
    echo -e "\e[0;33m 8. History (Commands)///// \e[0m"
    echo
    history
    echo
    echo "###############################################"
    echo
    echo -e "\e[0;33m 9. List User Names///// \e[0m"
    echo
    cut -d: -f1 /etc/passwd
    echo
    echo "###############################################"
    echo
    echo -e "\e[0;33m 10. Check for Null Passwords///// \e[0m"
    echo
    users="$(cut -d: -f 1 /etc/passwd)"
    for x in $users
    do
    passwd -S $x |grep "NP"
    done
    echo
    echo "###############################################"
    echo
    echo -e "\e[0;33m 11. Failed login attempts///// \e[0m"
    echo
    grep --color "failure" /var/log/secure
    echo
    echo "###############################################"
    echo
    END=$(date +%s)
    DIFF=$(( $END - $START ))
    echo Script completed in $DIFF seconds :
    echo
    echo Executed on :
    date
    echo

} >  $path/linuxAudit_$date.txt

sleep 10

scp linuxAudit_$date.txt ubuntuadmin@192.168.46.53:/home/ubuntuadmin/Documents/log

sleep 20

rm /home/admin/Documents/log/linuxAudit_$date.txt