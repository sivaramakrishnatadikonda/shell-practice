#!/bin/bash

USERID=$( id -u )

if [ $USERID -ne 0 ]

then 
    echo "ERROR:: please run this script with root acess"
    exit 1
else
    echo "you are running with root acess"
fi
dnf install mysql -y

if [ $! -eq 0 ]

then 
    echo "installing mysql is ....... success"
else
    echo "installing mysql is ...... failure"
    exit 1
fi
