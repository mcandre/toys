/*
   Name: Pi Calculator Beta 2, using Wallis' Formula.
   Original author: Sayan Chakraborti.
   Assembly version by: zWaRd (James Laird).
   Description: This program approximates pi (64-bit floating point)
   Original date: Saturday, June 2, 2002.
   Revised: Tuesday, June 8, 2002  01:24AM.
   Copyright: This program is distributed under the GNU General Public License.
*/

#include<stdio.h>
long int temp=0,num=0,den=1,terms;
double error=1;
long double out=1;
main()
{

	printf("\n\n***************************************************************\n\n");
	printf("Give number of terms to calculate\nTerms = ");
	scanf("%d",&terms);
	while (temp < terms) {
		__asm__ __volatile__ (	"movl _num, %%ecx\n\t" \
				"movl _den, %%ebx	\n\t" \
				"movl _temp, %%eax	\n\t" \
				"pushl %%eax			\n\t" \
				"andl $0x00000001, %%eax	\n\t" \
				"jz b				\n\t" \
				"incl %%ebx			\n\t" \
				"incl %%ebx			\n\t" \
				"jmp c				\n\t" \
				"b:				\n\t" \
				"incl %%ecx			\n\t" \
				"incl %%ecx			\n\t" \
				"c:\n\t popl %%eax		\n\t" \
				"incl %%eax			\n\t" : "=a" (temp), "=b" (den), "=c" (num) : "a" (temp), "b" (den), "c" (num) : "memory");
		out = out*((long double)num/(long double)den);
	}
	out *= 2;
	printf("Pi = %1.56Lf\n",out);
	error=3.14159265359/(3.14159265359-out);
	if(error<0)error=-error;
	printf("Error is 1 in %10.0lf for first 12 digits",error);
	printf("\n\n***************************************************************\n\n");
	getchar();
	printf("\n");
	return;
}


