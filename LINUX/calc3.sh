#!/bin/bash

# LAb 9
# Evgenii Filatov 40852239
# 20f_CST8102_320
# mycalc.sh 
# NOV/30/2020
# The script file perform the following operations: '+' and '-' (addition and subtraction).

# Create functions add and subtracttion. 
#Take 2 parameters, calculate add. Print out.
function add () {
	    a=$1 b=$2
	    echo "The sum of $1 plus $2 equals $(( a + b ))"
	   }
# Take 2 parameters, calculate subtraction. Print out.
function subtract () {
	    a=$1 b=$2
	    echo "The difference of $1 minus $2 equals $(( a - b ))"
	   }

# if there is  3 parameters
if [ $# == 3 ] 
  then
    # if 2nd parameter is "+", do addition
    if [ $2 == "+" ] 
      then
	add $1 $3
    # if 2nd parameter is "-", do subtraction
    elif [ $2 == "-" ] 
	then
	 subtract $1 $3
    else
    # If 2nd parameter doesn`t match with '+' or '-' error
  	echo "Invalid choice. 2nd parameter must be + or -"
     fi
elif [ $# == 0 ]
  then
  
   choice=n       #initialize to dummy value
  # take choice until choice equal "X" or "x"
   while [ $choice != "X" ] && [ $choice != "x" ]
    do
     sign=0
     # print 1 menu
     clear
     echo "C) Calculation"
     echo "X) Exit"
     read choice
   # if "C" or "c" get 1st integer 
     case $choice in
      [Cc])  while [ $choice != "X" ] && [ $choice != "x" ]
        do
         clear
         echo "Please enter an integer number or X to exit:"
         read choice
         case $choice in
      # if "X" or "x" break out of loops
           [Xx]) break ;;
      # if the entered parameter is an integer, save it and continue   
           *) val1=$choice
         esac
         clear
      # Execute while loop until sign is '+'||'-'||'X'||'x'
         while [ $sign == 0 ]
	    do
	    #Print menu 3
	     clear
	     echo "+) Add"
	     echo "-) Subtract"
	     echo "X) Exit"
	     read choice
	     case $choice in
 	      [+-]) sign=$choice
	            break ;;		 
  	      [Xx]) break ;;		
	      esac
	   done 
         clear
       #Enter 3rd parameter same like 1st
         echo "Please enter an integer number or X to exit:"
         read choice
         case $choice in
           [Xx]) break ;;
           *) val2=$choice
         esac
      #Calculate the result with the appropriate function.
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
    else
  echo " Wrong input. Enter 0 or 3 parameters"
fi
