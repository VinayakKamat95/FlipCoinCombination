#!/bin/bash -x

declare -A singletDict
declare -A doubletDict

NO_TIMES_COIN_FLIP=10
IS_HEAD=1

#singlet variables
hCount=0
tCount=0

#dublet variables
hhCount=0
htCount=0
thCount=0
ttCount=0


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

count=0

while [ $count -ne $NO_TIMES_COIN_FLIP  ]
do
	bin=$((RANDOM%2))
	bin1=$((RANDOM%2))

	doublet=$bin$bin1

	doubletDict[$count]=$doublet

	case "$doublet" in

	   11)
   	((hhCount+=1))
   	;;
   	10)
   	((htCount+=1))
   	;;
   	01)
   	((thCount+=1))
   	;;
   	00)
   	((ttCount+=1))
   	;;

	esac

((count++))

done

echo ${doubletDict[@]};

hhWinsPercent=`echo "scale=3;$hhCount/$NO_TIMES_COIN_FLIP*100" | bc`
echo $hhWinsPercent;

htWinsPercent=`echo "scale=3;$htCount/$NO_TIMES_COIN_FLIP*100" | bc`
echo $htWinsPercent;

thWinsPercent=`echo "scale=3;$thCount/$NO_TIMES_COIN_FLIP*100" | bc`
echo $thWinsPercent;

ttWinsPercent=`echo "scale=3;$ttCount/$NO_TIMES_COIN_FLIP*100" | bc`
echo $ttWinsPercent;
