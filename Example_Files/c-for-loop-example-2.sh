#!/bin/bash
begin1=1
begin2=20
finish=20
for (( a=$begin1, b=$begin2; a<$finish; a++, b-- ))
do
	c=$(( a**2 ))
	d=$(( b**2 ))
	echo $c $d
done
