#!/bin/bash

# LAb 8
# Evgenii Filatov 40852239
# 20f_CST8102_320  NOV/25/2020"
# myscript.sh 
# NOV/29/2020
# Script file for the purpose of user and group management in Linux. 

 choice=n       #initialize to dummy value

   # taking user choice until choice = Q or q
 while [ "$choice" != "Q" ] && [ "$choice" != "q" ]  
    
 	do clear

	 # printing the menu
		echo -e "Choose one of the following options:"
		echo -e "A Create a user account"
		echo -e "B Delete a user account"
		echo -e "C Change supplementary group for a user account"
		echo -e "D Change initial group for a user account"
		echo -e "E Change default login shell for a user account"		
		echo -e "F Change account expiration date for a user account"
		echo -e "Q Quit"
		echo -e "What would you like to do?: " 
		read choice
		sleep 3


		# if choice "A" or "a" prompt the following information
 
		if [ $choice == "A" ] || [ $choice == "a" ]
			then 	
				echo -e "Create a user account"
				echo -e "Enter Username: \c"  
				read username
      		               echo -e "Enter $username's home directory: \c" 
      		               read directory
				echo -e "Enter default login shell: "
				sudo cat /etc/shells
				read defaultLoginShell
			#  create the account
				sudo useradd -m -d $directory -s $defaultLoginShell $username
				echo "Account for user $username created."
				sleep 3

		# if choice "B" or "b"
		# prompt for username of the account to be deleted 
		elif [ $choice == "B" ] || [ $choice == "b" ]
			then 
				echo -e "Delete a user account"
				echo -e "Enter user which account you want to delete: \c"
				read username
			# delete the user account and user`s home directory
				sudo userdel -r $username
				echo "$username's account deleted."
				sleep 3

		# if choice "C" or "c" 
		# prompt for username and group name that is added as a supplementary group for the user account 
		elif [ $choice == "C" ] || [ $choice == "c" ]
                        then
                               echo -e "Change supplementary group for a user account"
                               echo -e "Enter username for which you want to add supplementary group: \c"
				read username
				echo -e "Enter supplementary group's name for user $username: \c"
				read groupname

				sudo usermod -G $groupname $username 
				echo -e "$username's supplementary group added to $groupname."
				sleep 3

		# if choice  "D" or "d"
		# prompt for username and group name that is used as the initial group for the user account,
		# and change the initial group for the user account.
		elif [ $choice == "D" ] || [ $choice == "d" ]
			then
				echo -e "Change initial group for a user account"
				echo -e "Enter username for which you want to change initial group: \c"
				read username 
				echo -e "Enter initial group's name for user $username: \c"
				read groupname
				sudo usermod -g $groupname $username
				echo -e "$username's initial group changed to $groupname."
				sleep 3

		# if choice "E" or "e"
		# prompt for the username and shell name,
		# and change the default shell for the user account.
		elif [ $choice == "E" ] || [ $choice == "e" ]
			then
				echo -e "Change default login shell for a user account"		
				echo -e "Enter username for which you want to change default shell: \c"
				read username
				echo -e "Enter shell name:"
				sudo cat /etc/shells
				read userShell
				sudo chsh -s $userShell $username
				echo -e "$username's default shell changed to $userShell."
				sleep 3

		# if choice "F" or "f"
		# prompt for username and expiration date, 
		# and change the expiration date for the user account
		elif [ $choice == "F" ] || [ $choice == "f" ]
			then 
				echo -e "Change account expiration date for a user account"	
				echo -e "Enter username for which you want to change account expiration date: \c"
				read username
				echo -e "Enter expiration date for the $username's account in the format YYYY-MM-DD: \c"
				read expirationDate
				sudo usermod -e $expirationDate $username
				echo -e "Account expiration date for $username is changed to $expirationDate."
				sleep 3

		# if choice "Q" or "q" quit the program				
		elif [ $choice == "Q" ] || [ $choice == "q" ]
			then 
				echo "Script complite"
				cd ..
			        sleep 3
		# if choice doesnt match give a message
		else
			echo "Invalid choice. Choose from menu."
			sleep 3
		fi 
	done