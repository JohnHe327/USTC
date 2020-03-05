#include <stdio.h>
int main()
{
	int a,b,c,d;
	int m;
	printf("Input four integer: ");
	scanf("%d%d%d%d",&a,&b,&c,&d);
	if (a>b)
		{
			m=a;
			a=b;
			b=m;
		}
	if (b>c)
		{
			m=b;
			b=c;
			c=m;
		}
	if (c>d)
		{
			m=c;
			c=d;
			d=m;
		}
	if (a>b)
		{
			m=a;
			a=b;
			b=m;
		}
	if (b>c)
		{
			m=b;
			b=c;
			c=m;
		}
	if (a>b)
		{
			m=a;
			a=b;
			b=m;
		}
	printf("%d %d %d %d",a,b,c,d);
	return 0;
}
