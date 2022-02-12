#!/bin/bash
n=10
i=0
while [ $i -lt $n ]
do
	echo $i
	(( i++ ))
	if [ $i -eq 5 ]
	then
		echo 5 is bad news
		break
	fi
done
