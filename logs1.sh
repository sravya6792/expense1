source="/home/ec2-user/logs/"
if [ -d $source ]
then 
 echo "$source directory exists"
else
   echo "$source director not exists"
fi    
files=$(find $souce -name "*.log")