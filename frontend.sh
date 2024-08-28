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
        echo  -e "$2....$R is not success $N"| tee -a $LOG_FILE
    else
        echo  -e "$2...$G is success  $N"| tee -a $LOG_FILE

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
dnf install nginx -y &>>LOG_FILE
validate $? "ngnix is"

systemctl enable nginx &>>LOG_FILE
validate $? "enable nginx is "
systemctl start nginx &>>LOG_FILE
validate $? "start engnx is "
rm -rf /usr/share/nginx/html/*

curl -o /tmp/frontend.zip https://expense-builds.s3.us-east-1.amazonaws.com/expense-frontend-v2.zip &>>LOG_FILE
validate $? "download"
cd /usr/share/nginx/html
validate $? "change"
unzip /tmp/frontend.zip &>>LOG_FILE
validate $? "unzip is"

cp /home/ec2-user/expense1/expense.conf /etc/nginx/default.d/expense.conf

systemctl restart nginx
validate $? "restart is "