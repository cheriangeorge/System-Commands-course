#!/usr/bin/gawk -f
BEGIN{
	print "BEGIN action is processed";
}
{
	print "record:" $0;
	print "processing record number:" FNR;
	print "number of fields in the current record:" NF;
}
END{
	print "END action is processed";
}
