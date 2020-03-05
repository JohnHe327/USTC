#include <stdio.h> 
#include <math.h>
int main()
{
	unsigned int a,n;
	unsigned int num,S=0;
	printf("input a=");
	scanf("%u",&a);
	printf("Êı×ÖÎ»Êı£º");
	scanf("%u",&n);
	if (a<0||n<=0) printf("Illegal input.");
	else
	{
		num=(pow(10,n)-1)/9*a;
		while (num!=0)
		{
			S+=num;
			num/=10;
		}
		printf("Sum(a+aa+aaa+¡­)=%u",S);
	}
	return 0;
}
