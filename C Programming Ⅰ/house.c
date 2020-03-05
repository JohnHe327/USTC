#include <stdio.h>
int main()
{
	const unsigned int d=300000;
	float p=6000,r=0.01;
	float m;
	m=log(p/(p-d*r))/log(1+r);
	printf("month=%.1f\n",m);
	return 0;
} 
