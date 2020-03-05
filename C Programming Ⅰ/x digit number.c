#include <stdio.h>
int main()
{
	int num,Num,i=0,place=1,digit;
	printf("input number:");
	scanf("%d",&num);
	Num=num;
	
	while(num/place)
	{
	i++;
	place*=10;
	}
	printf("%d\n\n",i);
	
	i=place/10;
	
	while(num)
	{
	place/=10;
	digit=num/place;
	printf("%d\n",digit);
	num-=digit*place;
	}
	printf("\n");
	
	num=Num;
		
	while(place<=i)
	{
	digit=num%10;
	printf("%d",digit);
	num=(num-digit)/10;
	place*=10;
	}
	
	return 0;
}
