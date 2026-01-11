#!/i/bash

USERID= $(id -u)

if [ $USERID -ne 0 ]

then
    echo "ERROR:: please run the script with root access"
     exit 1
else  
    echo "Script is running with root access"
   
fi

VALIDATION(){

    if [ $1 - ne 0 ]
    then
        echo "installation $2 is sucess"
    else
        echo "installation $2 is failure"
        exit 1
    fi
}


dnf list installed mysql

if [ $? - ne 0 ]
then
    echo "mysql is not installed ----installed sucess"

dnf install mysql -y
VALIDATE $? "mysql"

else
    echo "mysql is already installed nothing to do"
    exit 1



dnf list installed nginx
if [ $? - ne 0 ]
then   
    echo "nginx is not installed install"
    dnf install nginx -y
    VALIDATE $? "nginx"
esle
    echo "nothing to do"
fi