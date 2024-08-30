#!/bin/bash
source=$1
destination=$2
if [ $# -ne 2 ]
then
    echo "plz give arguments"
fi    

if [ -d $source ]
then
   echo "$source exists"
else
    echo "$source not exists"
fi


if [ -d $destination ]
then
   echo "$destination exists"
else
    echo "$destination not exists"
fi

file=$(find $source -name "*.logs")
echo $file








    