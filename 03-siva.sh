#!/bin/bash
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOG_FOLDER= "/var/log/siva-logs"
SCRIPT_NAME= $ (echo $0 | cut -d "." -f1)
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME.log"
PACKAGES=("mysql" "nginx" "mongodb")

mkdir -p $LOG_FOLDER

echo "script started executing at : $(date)" | tee -a $LOG_FILE

if [ $USERID -ne 0 ]
then
    echo -e "$R ERROR:: please run the root access $N"
    exit 1
else   
    echo -e "$G you are running script with root access $N"

fi
VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 $G install sucessfuly $N "
    else
        echo -e "$2 $R not installed failure $N"
    fi 
}

for package in ${PACKAGES[@]}
do

dnf list installed $package

if [ $? -ne 0 ]
then
echo -e "$package is not installed ------ install"

dnf install $package -y
VALIDATE $!"installing $package"
else
    echo -e "$package is already install ---- $Y nothiong to do $N"
fi
done
