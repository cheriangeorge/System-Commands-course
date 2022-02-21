#!/usr/bin/gawk -f
BEGIN{
	ndays=5
	dformat="+%d/%b/%Y"
	for (i=0; i<ndays; i++) {
		cmdstr=sprintf("date --date=\"%d days ago\" %s", i, dformat)
		cmdstr | getline mydate
		dates[i]=mydate
	}
	dstring = ""
	for (i in dates) {
		dstring = dstring " " dates[i]
	}
	print "date string=" dstring
}
{
	ldate=substr($4,2,11)
	w = match(dstring,ldate)
	if(w != 0) {
		#print ldate " " $1 " " $7
		print ldate " " $1
		ipcount[$1]++
	}
}
END{
	print "ip stats-----------------------------------"
	for (j in ipcount) {
		print j " " ipcount[j]
		cmdstr = sprintf("dig +noall +answer -x %s", j)
		cmdstr | getline ipinfo
		print ipinfo
	}
}

