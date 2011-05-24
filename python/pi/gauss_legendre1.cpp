// pi.cpp : Definiert den Einsprungpunkt für die Konsolenanwendung.
//

/*	PI-Calculator V 0.1
	Author: Dr. M. Reber (DrQL)
	A Program to calculate the famous number pi to lots of decimals
	This Version just calculates 1 Million Digits of pi
	Usage: pi >pi.txt
	Date 08.07.2002
	Copyright: This program is distributed under the GNU General Public License
	It uses the Gaus-Legendre-Algorithm in connection with the apfloat-MP-Library */

#include <stdio.h>
#include "apfloat.h"

int main(void)
{
	int n;

	cout << "PI-Calculator V 0.1\n";
	cout << "Author: Dr. M. Reber (DrQL)\n";
	cout << "A Program to calculate the famous number pi to lots of decimals\n";
	cout << "This Version just calculates 1 Million Digits of pi\n";
	cout << "Usage: pi >pi.txt\n";
	cout << "Date 08.07.2002\n";
	cout << "Copyright: This program is distributed under the GNU General Public License\n";
	cout << "It uses the Gaus-Legendre-Algorithm in connection with the apfloat-MP-Library\n" << endl;


	apfloat a = apfloat (1, 1000000);
	apfloat b = invroot (apfloat (2, 1000000),2);
	apfloat x = a;
	apfloat y;
	apfloat c = a / 4;

	for (n = 1; n <= 19; n++)
	{
		y = a;
		a = (a+b)/2;
		b = sqrt(b*y);
		c = c-x*(a-y)*(a-y);
		x = 2*x;
	}

	cout << pretty << (a+b)*(a+b)/(4*c) << endl;

	return 0;
}
