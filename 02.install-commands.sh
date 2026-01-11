#!/bin/bash

USERID=$( id -u )

if [ $USERID -ne 0 ]

then 
    echo "ERROR:: please run this script with root acess"
    exit 1
else
    echo "you are running with root acess"
fi
VALIDATE(){

    if [ $1 - ne 0 ]
    then 
        echo "installed $2 is success"
    else
        echo "installed $2 is failure"
        exit 1
    fi
}

dnf list installed mysql
# check already installed or not. if installed $? is 0
# not installed $? is not 0.expression is true

if [ $? - ne 0 ]

then 
    echo "MYSQL is not installed ------ going to install "

    dnf install mysql -y

    if [ $? -eq 0 ]

    then 
    echo "installing mysql is ....... success"
    else
    echo "installing mysql is ...... failure"

    exit 1
    fi
else
    echo "MYSQL is already installed ---- nothing to do"

fi
