#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]
then 
    echo " $R ERROR:: please run script with root access $N "
    exit 1
else
    echo " $G you are already run the script with root access $N "
fi
