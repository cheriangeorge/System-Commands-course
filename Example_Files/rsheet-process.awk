#!/usr/bin/gawk -f 
BEGIN{
	OFS=" "
	FS=" "
}
{
	a = $1*$2
	b = $1+$2
	printf("%f %f %f %f\n", $1, $2, a, b)
}
END{
}
