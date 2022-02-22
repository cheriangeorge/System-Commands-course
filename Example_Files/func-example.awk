#!/usr/bin/gawk -f
BEGIN {
	FS=":"
	print "-----------begin----------"
	c=atan2(1,1)
	print "c=" c
	print "--------------------------"
}
{
	print $0
	myfunc1()
	a=$1
	b=myfunc2(a)
	print "b=" b
}
END {
	print "------------end-----------"
	d=myfunc2(c)
	print "d=" d
	print "--------------------------"
}
