#!/bin/bash -x

declare -A singletDict
declare -A doubletDict
declare -A tripletDict


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

#triplet variables
hhhCount=0
hhtCount=0
hthCount=0
httCount=0
thhCount=0
thtCount=0
tthCount=0
tttCount=0

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


count=0
while [ $count -ne $NO_TIMES_COIN_FLIP  ]
do
	bin=$((RANDOM%2))
	bin1=$((RANDOM%2))
	bin2=$((RANDOM%2))

	triplet=$bin$bin1$bin2

	tripletDict[$count]=$triplet

	case "$triplet" in
		111)
		((hhhCount+=1))
		;;
		110)
		((hhtCount+=1))
		;;
		101)
		((hthCount+=1))
		;;
		100)
		((httCount+=1))
		;;
		011)
		((thhCount+=1))
		;;
		010)
		((thtCount+=1))
		;;
		001)
		((tthCount+=1))
		;;
		000)
		((tttCount+=1))
		;;
	esac

((count++))

done

echo ${tripletDict[@]};

hhhWinsPercent=`echo "scale=3;$hhhCount/$NO_TIMES_COIN_FLIP*100" | bc`
echo $hhhWinsPercent;

hhtWinsPercent=`echo "scale=3;$hhtCount/$NO_TIMES_COIN_FLIP*100" | bc`
echo $hhtWinsPercent;

hthWinsPercent=`echo "scale=3;$hthCount/$NO_TIMES_COIN_FLIP*100" | bc`
echo $hthWinsPercent;

httWinsPercent=`echo "scale=3;$httCount/$NO_TIMES_COIN_FLIP*100" | bc`
echo $httWinsPercent;

thhWinsPercent=`echo "scale=3;$thhCount/$NO_TIMES_COIN_FLIP*100" | bc`
echo $thhWinsPercent;

thtWinsPercent=`echo "scale=3;$thtCount/$NO_TIMES_COIN_FLIP*100" | bc`
echo $thtWinsPercent;

tthWinsPercent=`echo "scale=3;$tthCount/$NO_TIMES_COIN_FLIP*100" | bc`
echo $tthWinsPercent;

tttWinsPercent=`echo "scale=3;$tttCount/$NO_TIMES_COIN_FLIP*100" | bc`
echo $tttWinsPercent;
