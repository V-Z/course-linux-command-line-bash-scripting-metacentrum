#!/bin/bash
NUMBER='^[0-9]+$'
if [ "$#" -ne "3" ]; then
    echo "Error! Requiring 3 parameters! Received $#.
    Usage number1 -plus/-minus/-product/-quotient number2
    Use -plus for sum, -minus for difference, -product
    for multiplication or -quotient for quotient."
    exit 1
  fi
if [[ ! $1 =~ $NUMBER ]]; then
    echo "Parameter 1 is not an integer!"
    exit 1
  fi
if [[ ! $3 =~ $NUMBER ]]; then
    echo "Parameter 3 is not an integer!"
    exit 1
  fi
case $2 in
  -plus) expr $1 '+' $3;;
  -minus) expr $1 '-' $3;;
  -product) expr $1 '*' $3;;
  -quotient) expr $1 '/' $3;;
  *) echo "Wrong option!
    Usage number1 -plus/-minus/-product/-quotient number2
    Use -plus for sum, -minus for difference,
    -product for multiplication or -quotient
    for quotient.";;
esac
exit
