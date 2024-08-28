#!/bin/bash
userdata=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[33m"
LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)

TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"
mkdir -p $LOGS_FOLDER
echo "hi"&>>$LOG_FILE


validate()
{
    if [ $? -ne 0 ]
    then
        echo  -e "$2....$R is not installed $N"| tee -a $LOG_FILE
    else
        echo  -e "$2...$G is installed  $N"| tee -a $LOG_FILE

    fi        
}

echo "$userdata"
if [ $userdata -ne 0 ]
then
   echo "plz choose root access"|tee -a $LOG_FILE
   exit 1
else
   echo "$package installed"&>>LOG_FILE
fi
dnf module disable nodejs:18 -y
validate $? "disable nodejs"

dnf module enable nodejs:20 -y
validate $? "disable nodejs"
dnf install nodejs -y
validate $? "install nodejs"
id expense &>>$LOG_FILE
if [ $? -ne 0 ]
then
   echo "user not exists"
useradd expense &>>$LOG_FILE
validate $? "adding user"
else
   echo "user already exists"
fi  

mkdir /app
validate $? "directory"

curl -o /tmp/backend.zip https://expense-builds.s3.us-east-1.amazonaws.com/expense-backend-v2.zip

validate $? "download"
cd /app
rm -rf /app/*
unzip /tmp/backend.zip &>>$LOG_FILe

npm install 
cp /home/ec2-user/expense1/backend.service /etc/systemd/system/backend.service


 dnf install mysql -y

 validate $? "mysql is"
 mysql -h mysql.daws83s.shop -uroot -pExpenseApp@1 < /app/schema/backend.sql
 systemctl daemon-reload
 validate $? "daemon is"
 systemctl enable backend
 validate $? "enable is"
 systemctl restart backend
 validate $? "restart is"
