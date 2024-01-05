#!/bin/bash
#
# sokdr
#
tput clear
trap ctrl_c INT
function ctrl_c() {
        echo "**You pressed Ctrl+C...Exiting"
        exit 0;
}
#
echo -e "###############################################"
echo -e "###############################################"
echo -e "###############################################"
echo " _     _                      _             _ _ _   "
echo "| |   (_)_ __  _   ___  __   / \  _   _  __| (_) |_ "
echo "| |   | |  _ \| | | \ \/ /  / _ \| | | |/ __ | | __|"
echo "| |___| | | | | |_| |>  <  / ___ \ |_| | (_| | | |_ "
echo "|_____|_|_| |_|\____/_/\_\/_/   \_\____|\____|_|\__|"
echo
echo "###############################################"
echo "Welcome to security audit of your linux machine:"
echo "###############################################"
echo
echo "Script will automatically gather the required info:"
echo "The checklist can help you in the process of hardening your system:"
echo "Note: it has been tested for Debian Linux Distro:"
echo
sleep 3
echo
while true; do
	read -p "Would you like to save the output? [Y/N] " output
	case ${output:0:1} in
        	y|Y)
            date=$ (date +%Y%m%d)
			echo
			read -p "Please denote the path for the file to save the output: " path
			echo
                	touch $path/LinuxAudit_$date.txt
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
			        echo "File will be saved on $path/LinuxAudit_$date.txt "
                    echo


                	exit 0;
        } >  $path/LinuxAudit_$date.txt
	break
        ;;
        n|N)
         echo "OK no file."
	break
        ;;
	*)
	echo "Exiting Please enter y or n. "
	;;
    esac
done