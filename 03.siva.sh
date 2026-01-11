#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR:: please run script with root access"
    exit 1
else    
    echo "you are running with root access"
fi



dnf list installed nginx

if [ $? - ne 0 ]
then    
    echo "nginx is not installed please install"

    dnf install nginx -y
       if [ $? - ne 0 ]
    then
        echo "nginx installed -------- sucessfully"
    else
        echo "nginx not installed ------ failure"
        exit 1
    fi

else
    echo "nginx is installed nothing to do"
    
fi


dnf list installed mysql

if [ $? - ne 0 ]
then    
    echo "mysql is not installed please install"

    dnf install mysql -y

      if [ $? - ne 0 ]
    then
        echo "mysql installed -------- sucessfully"
    else
        echo "mysql not installed ------ failure"
        exit 1
    fi


else
    echo "mysql is installed nothing to do"
    exit 1
fi

