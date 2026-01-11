#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR:: please run script with root access"
    exit 1
else    
    echo "you are running with root access"
fi

VALIDATE(){
    
     if [ $1 - ne 0 ]
    then
        echo "$2 installed -------- sucessfully"
    else
        echo "$2 not installed ------ failure"
        exit 1
    fi


}

dnf list installed nginx

if [ $? - ne 0 ]
then    
    echo "nginx is not installed please install"

    dnf install nginx -y
    VALIDATE $? "nginx"

else
    echo "nginx is installed nothing to do"
fi



