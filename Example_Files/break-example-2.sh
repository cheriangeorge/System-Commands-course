#!/bin/bash
n=10
i=0
while [ $i -lt $n ]
do
	echo $i
	j=0
	while [ $j -le $i ]
	do
		printf "$j "
		(( j++ ))
		if [ $i -eq 7 ]
		then
			#echo 7 is bad news
			break 2
		fi
	done
	(( i++ ))
done
