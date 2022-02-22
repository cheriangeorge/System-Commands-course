#!/usr/bin/gawk -f
BEGIN{
	print "Report of fee paid:";
	totfee=0
	FS=" "
}
{
	# print $0
	if ($1 ~ /[[:alpha:]]{2}[[:digit:]]{2}[[:alpha:]][[:digit:]]{3}+/) {
		roll=$1
		fee=$2
		rf[roll]=fee
		totfee += fee
		print roll " paid " fee
	}
}
END{
	cutoff=21500
	print "List of students who paid less than " cutoff
	ns=0
	for (r in rf)
	{
		ns++
		if(rf[r] < cutoff) print "check ", r, " paid only " rf[r]
	}
	avg = totfee/ns
	print "Total fee collected:" totfee
	print "Average fee collected:" avg
}
