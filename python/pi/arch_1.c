/*
Name: Pi Calculator Beta, using Archimedes' Method.
Author: Shamashis Sengupta (shamashis@peacefulaction.org).
Description: This program calculates the value of Pi using Archimedes' Method.
Date: Monday, January 6, 2003.
Copyright: This program is distributed under the GNU General Public License.
*/

/*
This program calculates the value of pi. First, a circle of known radius (the radius is an input
given by the user) is taken. Then, a regular polygon having 'n' number of sides is inscribed
within it and another regular polygon with the same number of sides is circumscribed around the
circle. As the value of 'n' is increased, the average value of the perimeters of the two regular
polygons approach the circumference of the circle. The average when divided by the diameter of
the circle gives the approximate value of pi.

For greater accuracy, 'n' has been taken as power of 2. If we join the centre of any one of the
two polygons to two adjacent vertices of the same polygon, the angle subtended between the two
straight lines must be known if we are to calculate the perimeter. For a 'n' sided polygon
(where n=2^r), this angle is (360/2^r)degrees=(45/2^(r-3))degrees. Since the value of cos 45
degree can be determined without using pi, the cosine of this angle can also be deduced by
repeatedly using the formula cos (x/2)=sqrt(((cos x) +1)/2).

This program calculates pi 16 times, taking n=2^r such that 'r' assumes the value 4 in the first
case and is increased by 1 during each calculation.
*/

#include<stdio.h>
#include<math.h>

int main() {
    int count, div, num, c;
    long double perimeter_outer, perimeter_inner, circumference, adha_dhar_bhetorer;
    long double adha_dhar_bahirer, radius, cos_halfangle, sin_halfangle,
    tan_halfangle;
    long double cos_of_stan, sin_of_stan, sides = 1.0;
    printf("Enter the radius of the circle.\n");
    scanf("%Lf", &radius);

    for (num = 1; num <= 16; num++) {
        sides = 1.0;
        div = num;

        for (c = 1; c <= div + 3; c++) {
            sides = sides * 2.0;
        }

        cos_of_stan = 1.0 / sqrt(2.0);

        for (count = 1; count <= div; count++) {
            cos_of_stan = sqrt((cos_of_stan + 1.0) / 2.0);
        }

        printf("\n%2.0d. Taking a polygon with %6.0Lf sides,", num, sides);
        cos_halfangle = sqrt((cos_of_stan + 1.0) / 2.0);
        sin_halfangle = sqrt(1.0 - (cos_halfangle * cos_halfangle));
        adha_dhar_bhetorer = radius * sin_halfangle;
        perimeter_inner = 2.0 * adha_dhar_bhetorer * sides;
        tan_halfangle = sin_halfangle / cos_halfangle;
        adha_dhar_bahirer = radius * tan_halfangle;
        perimeter_outer = 2.0 * adha_dhar_bahirer * sides;
        circumference = (perimeter_outer + perimeter_inner) / 2.0;
        printf(" pi calculated is %.10Lf", circumference / (2.0 * radius));
    }

    printf("\nPlease press 0 then press enter\n");
    scanf("%Lf", &radius);
    return (0);
}
