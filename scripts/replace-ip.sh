#! /bin/bash

FILE=$1

sed -i "s/0.0.0.0\/32/$(curl -s ifconfig.me)\/32/g" $FILE 
