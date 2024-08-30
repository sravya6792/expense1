#!/bin/bash
source=$1
destination=$2
days=${3:-14}
usage(){

echo "plz give input and output"
}
if [ $# -ne 2 ]
then
    usgae
fi    