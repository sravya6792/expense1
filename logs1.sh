source="/home/ec2-user/logs/"
backup="/home/ec2-user/backup/"


if [ -d $source ]
then 
 echo "$source directory exists"
else
   echo "$source director not exists"
fi    
files=$(find $source -name "*.log")
echo $files
cp $files  $backup
rm -rf $files