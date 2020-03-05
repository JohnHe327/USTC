#include <stdio.h>
int main()
{
	int num,factor,i;
	for (num=1;num<=1000;num++)
	{
		factor=0;
		for(i=1;i<num;i++)
		if (num%i==0) factor+=i;
		if (factor==num)
		{
			printf("%3d its factors are 1",num);
			for (i=2;i<num;i++)
			if (num%i==0) printf(",%3d",i);
			printf("\b\n");
		}
	}
}
