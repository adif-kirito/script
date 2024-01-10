#!/bin/bash

echo "Please select the server: "
echo "1) Server 1"
echo "2) Server 2"
echo "3) Exit"

read -p "Server: " option

case $option in
        1) ssh user@192.168.10.10 ; exit ;;
        2) ssh user@192.168.10.11 ; exit ;;
        *) exit ;;
esac