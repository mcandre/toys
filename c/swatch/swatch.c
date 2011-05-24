/*	Andrew Pennebaker (andrew.pennebaker@gmail.com)
	Copyright 2007 Andrew Pennebaker

	Credits:

	http://www.krugle.com/files/cvs/cvs.jabberstudio.org/neutron/plugins/time_plugin.py
	For the basic conversion method.

	http://www.acm.uiuc.edu/webmonkeys/book/c_guide/2.15.html
	Thanks for actual working example of C's time and date libraries. */

#include <stdio.h>
#include <time.h>

float beats(void) {
	time_t timer;
	struct tm *g;
	int hour, min, sec;
	int utc;
	int bmt;
	float beat;

	timer=time(NULL);

	g=gmtime(&timer);

	hour=g->tm_hour, min=g->tm_min, sec=g->tm_sec;

	utc=hour*3600+min*60+sec; // Greenwich, England

	bmt=utc+3600; // Biel, Switzerland

	beat=bmt/86.4;

	if (beat>1000)
		beat-=1000;

	return beat;
}

void swatch(char *result) {
	sprintf(result, "@%06.2f", beats());
}

int main(void) {
	char result[8];
	swatch(result);

	printf("%s\n", result);

	return 0;
}