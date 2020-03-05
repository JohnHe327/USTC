#include <stdio.h>
#include <math.h>
int main()
{
	const int money=1000,year=5;
	const float r1=0.0414,r2=0.0468,r3=0.054,r5=0.0585;
	const float r=0.0072;
	float p1,p2,p3,p4,p5;
	p1=money*(1+year*r5);
	p2=money*(1+2*r2)*(1+3*r3);
	p3=money*(1+3*r3)*(1+2*r2);
	p4=money*pow((1+r1),year);
	p5=money*pow((1+r/4),(4*year));
	printf("p1=%.2f\np2=%.2f\np3=%.2f\np4=%.2f\np5=%.2f\n",p1,p2,p3,p4,p5);
	return 0;
}
