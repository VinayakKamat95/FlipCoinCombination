#!/bin/bash -x

declare -A singletDict

NO_TIMES_COIN_FLIP=10
IS_HEAD=1

hCount=0
tCount=0
count=0

while [ $count -ne $NO_TIMES_COIN_FLIP  ]
do
	bin=$((RANDOM%2))

	singletDict[$count]=$bin

	if [ $bin -eq $IS_HEAD ]
	then
        	coin="heads"
        	hCount=$(($hCount+1))
	else
        	coin="tails"
        	tCount=$(($tCount+1))
	fi

((count++))

done


hWinsPercent=`echo "scale=3;$hCount/$NO_TIMES_COIN_FLIP*100" | bc`
tWinsPercent=`echo "scale=3;$tCount/$NO_TIMES_COIN_FLIP*100" | bc`

echo ${singletDict[@]}
echo "Heads Wins Percentage : "$hWinsPercent
echo "Tails Wins Percentage : "$tWinsPercent

