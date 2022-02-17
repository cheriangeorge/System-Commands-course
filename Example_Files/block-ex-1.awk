#!/usr/bin/gawk -f
BEGIN{
	print "BEGIN action is processed";
}
{
	print "Default action is processed";
}
END{
	print "END action is processed";
}
