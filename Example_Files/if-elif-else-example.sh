#!/bin/bash
if [ $# -gt 2 ]
then
	echo arguments given and more than sufficient $#
elif [ $# -gt 1 ]
then
	echo arguments given and sufficient $#
elif [ $# -gt 0 ]
then
	echo arguments given but not sufficient $#
else
	echo arguments are needed $#
fi
