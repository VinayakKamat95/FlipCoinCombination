#!/bin/bash -x

IS_HEAD=1

bin=$((RANDOM%2))

if [ $bin -eq $IS_HEAD ]
then
        coin="heads"
else
        coin="tails"
fi

echo "$coin"
