/*
Name: Pi Calculator Beta, using the arctan formula.
Author: Sayan Chakraborti.
Description: This program calculates the value of Pi using
(pi/4)=arctan(1) and arctan(x) = x-x^3/3+x^5/5-x^7/7+....
Date: Saturday, June 29, 2002.
Copyright: This program is distributed under the GNU General Public License.
Advisory Note: Unfortunately, this series converges to slowly to be useful, as it takes
over 300 terms to obtain a 2 decimal place precision. To obtain 100 decimal places of pi,
one would need to use at least 10^50 terms of this expansion! May the bogomips be with you.
*/

#include <stdio.h>

main() {
    int count, num;
    float pi = 0;

    printf("Calculate Pi by pi/4 = arctan(1) \nNumber of terms = ");
    scanf("%d", &num);

    for (count = 1; count <= num; count++) {
        if (count % 2) {
            pi = pi + (1.0 / (2.0 * count - 1));
        } else {
            pi = pi - (1.0 / (2.0 * count - 1));
        }
    }

    pi = pi * 4;
    printf("The approximate value of pi = %f\n", pi);
}
