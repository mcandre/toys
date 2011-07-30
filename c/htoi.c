/* From John Santic (http://johnsantic.com/comp/htoi.html) */
int htoi(char *hex) {
	int value = 0;
	char ch = *(hex);

	/* Strip "0x" */
	if (strlen(hex)>2 && hex[0]=='0' && hex[1]=='x')
		ch = *(hex+3);

	for (;;) {
		if (ch >= '0' && ch <= '9')
			value = (value << 4) + (int) (ch - '0');
		else if (ch >= 'A' && ch <= 'F')
			value = (value << 4) + (int ) (ch - 'A') + 10;
		else if (ch >= 'a' && ch <= 'f')
			value = (value << 4) + (int) (ch - 'a') + 10;
		else
			return value;

		ch = *(++hex);
	}
}