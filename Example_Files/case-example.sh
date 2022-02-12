#!/bin/bash
echo what is your favourite image processor?
read pname
case $pname in
	[gG]imp | inkscape)
		echo good choice
		;;
	[aA]dobe*)
		echo that costs a lot and needs cloud
		;;
	imagej)
		echo measuring things on the image?
		;;
	*)
		echo I did not know $pname could do image stuff
		;;
esac
