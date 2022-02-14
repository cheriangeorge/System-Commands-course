#!/bin/bash
usage()
{
	echo usage $1 str1 str2
}

swap()
{
	echo $2 $1
}

if [ $# -lt 2 ]
then
	usage $0
	exit 1
fi

swap $1 $2
