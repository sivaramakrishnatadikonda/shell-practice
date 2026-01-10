#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]

then 
    echo "ERROR:: please run this root acess"
    exit 1
else
    echo "you are running with root acess"
fi
