source="/home/ec2-user/logs/"
backup="/home/ec2-user/backup/"
mkdir -p backup

if [ -d $source ]
then 
 echo "$source directory exists"
else
   echo "$source director not exists"
fi    
files=$(find $source -name "*.log")
echo $files
mv $files $backup
rm -rf $files