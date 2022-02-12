#!/bin/bash
n=9
i=1
while [ $i -lt $n ]
do
	printf "\n loop $i:"
	j=0
	(( i++ ))
	while [ $j -le $i ]
	do
		(( j++ ))
		if [ $j -gt 3 ] && [ $j -lt 6 ]
		then
			continue
		fi
		printf "$j "
	done
done 
