#!/bin/bash

echo "Please select the server: "
echo "1) Remain at Jump Server"
echo "2) Access SFTP Server"
echo "3) Exit"

read -p "Server: " option

case $option in
    1) 
        echo "hello"

        ;;
    2) 
        sftp bank@192.168.46.101 ; exit 
        
        ;;
    *) exit ;;
esac