#include <stdio.h>
#include <math.h>
int main()
{
	int a,b,c,num;
	for(num=100;num<=999;num++)
	{
		a=num/100;
		c=num%10;
		b=(num-100*a-c)/10;
		if (pow(a,3)+pow(b,3)+pow(c,3)==num) printf("%d\n",num);
	}
	return 0;
}
