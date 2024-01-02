#!/bin/bash

	echo
	echo
	echo "#######################################################"
	echo "  _   _                 ____            _       _   	"
	echo " | | | |___  ___ _ __  / ___|  ___ _ __(_)_ __ | |_ 	"
	echo " | | | / __|/ _ \ '__| \___ \ / __| '__| | '_ \| __|	"
	echo " | |_| \__ \  __/ |     ___) | (__| |  | | |_) | |_ 	"
	echo "  \___/|___/\___|_|    |____/ \___|_|  |_| .__/ \__|	"
	echo "                                       |_|   		"
	echo
	echo "#######################################################"
	echo

while true; do

    # Display menu options
    echo "Menu:"
	echo "1. Check User Status"
	echo "2. Check User Last Lock"
	echo "3. Check User Group"
    echo "4. Create User (grp wheel)"
	echo "5. Lock User"
	echo "6. Delete User"
    echo "7. Quit"
    echo

    
    # Prompt user for choice
    read -p "Enter your choice: " choice

    case $choice in
		1)
			# To check user status
            # Prompt user for username
            read -p "Enter username (or 'q' to go back to the menu): " username

            # Check if user wants to go back to the menu
            if [ "$username" == "q" ]; then
                continue
            fi

            passwd -S $username
            echo -e

			sleep 3
            ;;
		2)
			# To check user last lock
            # Prompt user for username
            read -p "Enter username (or 'q' to go back to the menu): " username

            # Check if user wants to go back to the menu
            if [ "$username" == "q" ]; then
                continue
            fi

            chage -l $username
            echo -e

			sleep 3
            ;;
		3)
			# To check user group
            # Prompt user for username
            read -p "Enter username (or 'q' to go back to the menu): " username

            # Check if user wants to go back to the menu
            if [ "$username" == "q" ]; then
                continue
            fi

            groups $username
            echo -e

			sleep 3
            ;;
		4)
			# To create user
            # Prompt user for username
            read -p "Enter username (or 'q' to go back to the menu): " username

            # Check if user wants to go back to the menu
            if [ "$username" == "q" ]; then
                continue
            fi

            echo "Creating user for $username"
			useradd $username
			usermod -aG wheel $username
			passwd $username
			echo "Account $username created"
			echo -e

			sleep 3
            ;;
        5)
			# To lock user
            # Prompt user for username
            read -p "Enter username (or 'q' to go back to the menu): " username

            # Check if user wants to go back to the menu
            if [ "$username" == "q" ]; then
                continue
            fi

            echo "Lock user for $username"
			usermod -L -e 1 $username
			echo "Account $username locked"
			echo -e

			sleep 3
            ;;
		6)
			# To delete user
            # Prompt user for username
            read -p "Enter username (or 'q' to go back to the menu): " username

            # Check if user wants to go back to the menu
            if [ "$username" == "q" ]; then
                continue
            fi

			gpasswd -d $username wheel
			userdel $username
			echo "Done delete user for $username"
			echo -e

			sleep 3
            ;;
        7)
			# To exit
            echo "Exiting script. Goodbye!"
            exit 0
            ;;
        *)
            echo "Invalid choice. Please enter 1 or 2."
            ;;
    esac

	echo
	echo "###############################################"
	echo
	echo
done
