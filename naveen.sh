#!/bin/bash
source=$1
destination=$2
days=${3:-14}
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)

usage(){

echo "plz give input and output"
}
if [ $# -ne 2 ]
then
    usage
fi    
if [  -d $source ]
then
    echo "$source exists"
else
    echo "$source not exists"
fi

if [  -d $destination ]
then
    echo "$source exists"
else
    echo "$source not exists"
fi
files=$(find $source -name "*.log")
echo "$files"
zipfile="$destination/app-logs-timestamp.zip

find ${source} -name "*.log" | zip "$zipfile" -@
echo $zipfile
