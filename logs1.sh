

source=/home/ec2-user/naveen
tar -cvzf backup.tar.gz /home/ec2-user/logs


if [ -d $source ]
then
    echo "$source exists"
else
    echo "    $source not exists"


fi
file=$(find $source -name "*.log")    

echo "$file"
rm -rf $file
