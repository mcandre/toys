/*
   Name: Pi Calculator Beta, via estimating the circumference.
   Original author: Shamashis Sengupta.
   Description: This program approximates pi.
   Date: Saturday, September 14, 2002.
   Copyright: This program is distributed under the GNU General Public License.

---------------------------
Circumference Method 1
---------------------------
This program was written by me on 14th September,2002, between 7.00 and 7.55
a.m. when I did not have the computer in front of me.

How this program works:
Let us consider a circle with its centre at the origin of the co-ordinate
system. The user is required to input the value of the radius. The program
considers one paricular point on the circle (the point to begin with is the
one where the circle intersects the x-axis in the first quadrant) and
calculates the ordinate of the next point from the equation
x^2+y^2=radius^2, the value by which the abscissa decreases having been
specified earlier by the user. The distance between two such consecutive
points is treated as a straight line and this distance is calculated. The
distances between all these consecutive points are added till we reach the
point (0,radius) and the sum is multiplied by 4 to get the approximate value
of the circumference of the circle. The obtained value is divided by twice
the radius and the approximate value of pi is obtained as the output.

Note:
It is best to input the decrease in abscissa as unity since then the
calculations become much easier and the accuracy in measuring the value of
pi can be increased by entering a larger radius. You may use bigger variables
like long double or long long double to increase accuracy.
                        -Shamashis Sengupta
---------------------------
*/

#include<stdio.h>
#include<math.h>

double find(double x,double a)
{
double y;
y=sqrt((a*a)-(x*x));
return y;
}

int main()
{
double ind,delta,rad,dec,sum=0.0,x,y,xnow,ynow,length;
printf("Enter the radius.\n");
scanf("%lf",&rad);
printf("Enter the decrease in x.\n");
scanf("%lf",&dec);
x=rad;
y=0.0;
delta=rad/100.0;
ind=1.0;
for(xnow=rad;xnow>=0.0;xnow=xnow-dec)
 {
 ynow=find(xnow,rad);
 length=sqrt(((x-xnow)*(x-xnow))+((ynow-y)*(ynow-y)));
 sum=sum+length;
 x=xnow;
 y=ynow;
 if(xnow<=rad-(ind*delta))
 {
	 printf("\n%.0lf of 100 completed.",ind);
	 ind=ind+1.0;
 }
 }
printf("\nPi=%.10lf",2.0*sum/rad);
printf("\nPress 0 and Enter to exit\n");
scanf("%lf",&dec);
return(0);
}



