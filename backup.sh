#!/bin/bash

source="/home/ec2-user/app-1"
dest="/home/ec2-user/app-2"
if [ -d $source ]
then
    echo "$source exists"
else
       echo "$source  not exists"
fi    

if [ -d $dest ]
then
    echo "$dest exists"
else
       echo "$dest  not exists"
fi
file=$(find $source -name "*.log")
echo $file