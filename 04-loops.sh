#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]
then 
    echo -e " $R ERROR:: please run script with root access $N "
    exit 1
else
    echo -e  " $G you are already run the script with root access $N "
fi

dnf list installed mysql
if [ $? -ne 0 ]
then
    echo -e  "$R if mysql is not installed ------ please install $N"
else
    echo  -e " $Y if mysql is installed ------- nothing to do $N"
fi