#!/bin/bash

if [ $# -lt 2 ]
then
	echo use with two natural naumbers as arguments
	exit 1
fi

re='^[0-9]+$'
if ! [[ $1 =~ $re ]]
then
	echo $1 is not a natural number
	exit 1
fi

if ! [[ $2 =~ $re ]]
then
	echo $2 is not a natural number
	exit 1
fi

let a=$1*$2
echo product a is $a
(( a++ ))
echo product a incremented is $a

let b=$1**$2
echo power is $b

c=$[ $1 + $2 +10]
echo sun+10 is $c

d=$(expr $1 + $2 + 20)
echo sum+20 is $d

f=$(( $1 * $2 * 2 ))
echo product times 2 is $f
