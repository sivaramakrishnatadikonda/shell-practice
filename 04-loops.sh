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

VALIDATE(){
    if [ $1 -eq 0 ]
    then
    echo -e " $G $2 is installed ------ install sucessfully $N"
    else
    echo -e  " $R $2 is not installed ----- failure $N"
    exit 1
    fi

}
dnf list installed mysql
if [ $? -ne 0 ]
then
    echo -e  "$R if mysql is not installed ------ please install $N"
    
    dnf install mysql -y
    VALIDATE $? "mysql"
   
else
    echo  -e " $Y if mysql is installed ------- nothing to do $N"
fi

dnf list installed nginx
if [ $? -ne 0 ]
then
    echo -e  "$R if nginx is not installed ------ please install $N"
    
    dnf install nginx -y
    VALIDATE $? "nginx"
   
else
    echo  -e " $Y if nginx is installed ------- nothing to do $N"
fi
