#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOG_FLODER= "/var/log/shellscript.logs"
SCRIPT_NAME= $(echo $0 | cut -d "." -f1)
LOG_FILE= "$LOG_FLODER/$SCRIPT_NAME .log"
PACKAGES=("mysql" "nginx" "python")

mkdir -p $LOG_FLODER
echo "script started executing at : $(date)" | tee -a $LOG_FILE


if [ $USERID -ne 0 ]
then 
    echo -e " $R ERROR:: please run script with root access $N " | tee -a $LOG_FILE
    exit 1
else
    echo -e  " $G you are already run the script with root access $N " | tee -a $LOG_FILE
fi

VALIDATE(){
    if [ $1 -eq 0 ]
    then
    echo -e " $G $2 is installed ------ install sucessfully $N" | tee -a $LOG_FILE
    else
    echo -e  " $R $2 is not installed ----- failure $N" | tee -a $LOG_FILE
    exit 1
    fi

}
for package in $@
do

dnf list installed $package & >> LOG_FILE
dnf install $package -y & >> LOG_FILE
VALIDATE $? "$package"
done