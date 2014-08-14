// pi4.cpp : Definiert den Einsprungpunkt für die Konsolenanwendung.
//

/*	PI-Calculator V 0.4
	Author: Dr. M. Reber (DrQL)
	A Program to calculate the famous number pi to lots of decimals
	This Version just calculates 100000 Digits of pi
	Usage: pi >pi.txt
	Date 12.07.2002
	Copyright: This program is distributed under the GNU General Public License
	It uses the Chudnovsky-Algorithm in connection with the apfloat-MP-Library */

#include <stdio.h>
#include <time.h>
#include "apfloat.h"

int main(void)
{
	long i;
    time_t tt;
    clock_t tc;
	size_t prec;

	cerr << "PI-Calculator V 0.4\n";
	cerr << "Author: Dr. M. Reber (DrQL)\n";
	cerr << "A Program to calculate the famous number pi to lots of decimals\n";
	cerr << "This Version just calculates 100000 Digits of pi\n";
	cerr << "Usage: pi >pi.txt\n";
	cerr << "Date 12.07.2002\n";
	cerr << "Copyright: This program is distributed under the GNU General Public License\n";
	cerr << "It uses the Chudnovsky-Algorithm in connection with the apfloat-MP-Library\n" << endl;


	tt = time(0);
	prec = 100000;
	apfloat A, B, C, C3, n;
	A = 13591409;
    B = 545140134;
	C = 640320;
	C.prec(prec);
	C3 = C*C*C;
	apfloat a = apfloat (13591409, prec);
	apfloat y = apfloat (1, prec);
	for (i = 1; i <= prec/14; i++)
	{
		tc = clock ();
		n = i;
		y = -1*y*(6*n-5)*(6*n-4)*(6*n-3)*(6*n-2)*(6*n-1)*(6*n)/((3*n-2)*(3*n-1)*(3*n)*n*n*n*C3);
		a = a+y*(A+n*B);
		cerr << i << endl;
	}

	cout << pretty << C*sqrt(C)/12/a << endl; 
	cerr << "elapsed time " << difftime (time (0), tt) << " seconds" << endl;;

	return 0;
}
