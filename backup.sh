#!/bin/bash

source="/home/ec2-user/app-1"
dest="/home/ec2-user/app-2"
if [ -d $source ]
then
    echo "$source exists"
else
       echo "$source  not exists"
fi       