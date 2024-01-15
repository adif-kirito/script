#!/bin/bash

date=$(date +%Y%m%d)
hostname=$(cut -d. -f1 /etc/hostname)
touch lastLogin_$hostname.txt
{            
    echo -e "\e[0;33m Last login for 2024 \e[0m"
    echo
    last -F | grep 2024
    echo
    echo "Date: " $date
    

} >  lastLogin_$hostname.txt