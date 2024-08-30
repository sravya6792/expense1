#!/bin/bash
source=$1
destination=$2
if[ $# -ne 2 ]
then
    echo "plz give arguments"
if [ -d $source ]
then
   echo "$source exists"
else
    echo "$source not exists"
fi
        