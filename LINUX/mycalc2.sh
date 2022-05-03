#!/bin/bash

# LAb 9
# Evgenii Filatov 40852239
# 20f_CST8102_320
# mycalc.sh 
# NOV/30/2020
# The script file perform the following operations: '+' and '-' (addition and subtraction).

# Take 2 integers as parameters and calculate sum .
        function add () {
  	  a1=$1
  	  a2=$2
   	 echo "The sum of $1 plus $2 equals $(( a1 + a2 ))"
 	 }

# Take 2 integers as parameters and calculate subtract.
        function subtract () {
   	  a1=$1
  	  a2=$2
  	  echo "The subtract of $1 minus $2 equals $(( a1 - a2 ))"
	}

# if we've got 3 parameters
	if [ $# == 3 ] 
	   then
    # if we have 2nd parameter "-" do subtraction
        if [ $2 == "-" ] 
  	   then
		subtract $1 $3
    # if we have 2nd parameter "+" do addition
      	 elif [ $2 == "+" ] 
   		 then
		    add $1 $3
         else
    # if invalid choice of 2nd parameter
	echo "Invalid choice. Second parameter must be + or -"
?        fi

     elif [ $# == 0 ]
           then
                   # interactive mode

    choice=n       #initialize to dummy value

    # take choice until choice equal "X" or "x"
    while [ $input != "X" ] && [ $input != "x" ]
    do
	sign=0		# for reset every loop iteration as we could just finish the math

     # print 1 menu
        clear
 	echo "C) Calculation"
	echo "X) Exit"
	read input

   						 	# if choice "C" or "c"
    							# ask for 1 parameter
	case $input in
   								 # if choice is "C" or "c"  asking parameters
	    [Cc])  while [ $input != "X" ] && [ $input != "x" ]
			do
			    clear
			    echo "Please enter an integer number or X to exit:"
			    read input
			    case $input in
								# if choice "X" or "x"  break out of loop.
								#  outer loop will exit too
				    [Xx]) break ;;
			            ''|*[!0-9]*) input=n  ;;
		 							#  we've  got 1 integer
				    					# ask user to select operation
				    *)	val1=$input
				esac				# loop until we get the sign set
					
					    # print Menu3
					    clear
					    echo "+) Add"
					    echo "-) Subtract"
					    echo "X) Exit)"
					    read input
					    case $input in
						[Xx]) break ;;			# save sign if + or - enterd then break out to get the second number
                                               ''|*[!+-]*|*[!Xx]*) echo "invalid choice"
						input=n ;;
						[+-]) sign=$input
									# break out of the loop. since input is presrved we'll break all outer loops and exit
	 				    esac
                                clear
			    echo "Please enter an integer number or X to exit:"
			    read input
			    case $input in 
			    [Xx]) break ;;
     			    ''|*[!0-9]*) input=n  ;;
			     *)	val2=$input
			     esac

		case $sign in
		-) subtract $val1 $val2
		+) add $val1 $val2
		sleep 3
		break ;;
	        esac
	done ;;
	esac
done ;;