/*	Andrew Pennebaker (andrew.pennebaker@gmail.com)
	Copyright 2008 Andrew Pennebaker */

#include <stdio.h>
#include <time.h>

int hexSeconds(void) {
	time_t timer;
	struct tm *local;
	float seconds;

	timer=time(NULL);

	local=localtime(&timer);

	seconds=local->tm_hour*3600+local->tm_min*60+local->tm_sec;

	return (int) (seconds*65536.0/86400.0);
}

void hexTime(char *result) {
	int seconds=hexSeconds();

	int hhour=seconds/4096;

	int hmin=(seconds%4096)/16;

	int hsec=seconds%16;

	sprintf(result, "%x_%02x_%x", hhour, hmin, hsec);
}

int main(void) {
	char result[7];
	hexTime(result);

	printf("%s\n", result);

	return 0;
}