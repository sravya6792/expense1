#!/bin/bash
source="/home/ec2-user/hello"
if [ -d $source ]
then
    echo "$source exists"

else 
    echo"$source exists"
fi    
file=$(find $source -name "*.logs")
echo $file

    
        