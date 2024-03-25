#!/bin/bash
#
# By Adif Firdaus
#
date=$(date +%Y%m%d)
path=$(pwd)
hostname=$(hostname)

echo "#######################################################"
echo
echo " _     _                      _             _ _ _   "
echo "| |   (_)_ __  _   ___  __   / \  _   _  __| (_) |_ "
echo "| |   | |  _ \| | | \ \/ /  / _ \| | | |/ __ | | __|"
echo "| |___| | | | | |_| |>  <  / ___ \ |_| | (_| | | |_ "
echo "|_____|_|_| |_|\____/_/\_\/_/   \_\____|\____|_|\__|"
echo
echo "#######################################################"
echo
echo
echo "Current hostname: $hostname"
read -p "Do you want to change the hostname? (y/n)" choice
case "$choice" in
  y|Y)
    read -p "Enter new Hostname: " hostname
    echo "Hostname changed to: $hostname"
    sleep 2
    echo "Script is running..."
    ;;
  n|N)
    echo "No changes made to the hostname."
    echo "Script is running..."
    ;;
  *)
    echo "Invalid choice. Please enter 'y' or 'n'."
    ;;
esac


name="$hostname"_linuxAudit_"$date".txt
touch $path/$name

echo
{            
    echo "#######################################################"
    echo
    echo " _     _                      _             _ _ _   "
    echo "| |   (_)_ __  _   ___  __   / \  _   _  __| (_) |_ "
    echo "| |   | |  _ \| | | \ \/ /  / _ \| | | |/ __ | | __|"
    echo "| |___| | | | | |_| |>  <  / ___ \ |_| | (_| | | |_ "
    echo "|_____|_|_| |_|\____/_/\_\/_/   \_\____|\____|_|\__|"
    echo
    echo "#######################################################"
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
    echo -e "\e[0;33m 4. Server Uptime Information///// \e[0m"
    echo
    uptime
    echo
    echo "###############################################"
    echo
    echo -e "\e[0;33m 5. Check Disk Usage///// \e[0m"
    echo
    df -h
    echo
    echo "###############################################"
    echo
    echo -e "\e[0;33m 6. Check CPU and Memory Usage///// \e[0m"
    echo
    top -n 1 -b
    echo
    echo "###############################################"
    echo
    echo -e "\e[0;33m 7. Check Running Processes///// \e[0m"
    echo
    ps -aux
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
    echo -e "\e[0;33m 12. Active Internet Connections and Open Ports///// \e[0m"
    echo
    netstat -tulpn
    echo
    echo "###############################################"
    echo
    echo -e "\e[0;33m 13. IP Address///// \e[0m"
    echo
    ifconfig | awk '/inet / {print $2, $4}'
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

} >  $path/$name
echo "Script completed!!!"
