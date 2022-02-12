#!/bin/bash
filename=largefile.txt
if [ -e $filename ]
then
	echo file $filename exists
	exit 1
fi
i=1
while [ $i -lt 10 ]
do
	echo $i $[$i+1]
	(( i++ ))
done > $filename

echo file $filename written
ls -l $filename
