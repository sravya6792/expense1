

source=/home/ec2-user/naveen




if [ -d $source ]
then
    echo "$source exists"
else
    echo "    $source not exists"


fi
file=$(find $source -name "*.log")    

echo "$file"
cp -r $file /home/ec2-user/logs



