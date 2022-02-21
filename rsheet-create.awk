#!/usr/bin/gawk -f
BEGIN{
	nl = 2000000
	nc = 2
	for (j=0; j<nl; j++) {
		for (i=0; i<nc; i++) {
			printf("%f ", rand())
		}
		printf("\n")
	}
}
{
}
END{
	#print nl " lines with " nc " columns of random numbers created"
}
