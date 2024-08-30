#!/bin/bash
source=$1
destination=$2
days=${3:-14}
usage(){

echo "plz give input and output"
}
if [ $# -ne 2 ]
then
    usage
fi    
if [ ! -d $source ]
then
    echo "$source exists"
else
    echo "$source not exists"
fi

if [ ! -d $destination ]
then
    echo "$source exists"
else
    echo "$source not exists"
fi
