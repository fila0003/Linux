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
       fi

elif [ $# == 0 ]
       then
                   # interactive mode

    choice=n       #initialize to dummy value

    # take choice until choice equal "X" or "x"
    while [ $choice != "X" ] && [ $choice != "x" ]
    do
	sign=0		# for reset every loop iteration as we could just finish the math

     # print 1 menu
        clear
 	echo "C) Calculation"
	echo "X) Exit"
	read choice
	case $choice in
 								
	    [Cc])  while [ $choice != "X" ] && [ $choice != "x" ]
			do
			    clear
			    echo "Please enter an integer number or X to exit:"
			    read choice
			    case $choice in
				  [Xx]) break ;;
			           ''|*[!0-9]*) choice=n  ;;
				   *)	val1=$choice
				esac				
					
					    # print Menu3
					    clear
					    echo "+) Add"
					    echo "-) Subtract"
					    echo "X) Exit)"
					    read choice
					    case $choice in
						[Xx]) break ;;			
                                               ''|*[!+-]*|*[!Xx]*) echo "invalid choice"
						choice=n ;;
						[+-]) sign=$choice				
	 				    esac
                                clear
			    echo "Please enter an integer number or X to exit:"
			    read choice
			    case $choice in 
			      [Xx]) break ;;
     			      *) val2=$choice
			     esac

		case $sign in
		-) subtract $val1 $val2
		sleep 3
		break ;;
		+) add $val1 $val2
		sleep 3
		break ;;
	        esac
	done ;;
	esac
done 
fi