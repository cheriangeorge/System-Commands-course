#!/bin/bash
begin=1
finish=10
for (( a=$begin; a<$finish; a++))
do
	b=$(( a**2 ))
	echo $b
done
