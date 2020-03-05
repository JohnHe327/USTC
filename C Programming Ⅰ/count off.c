#include <stdio.h>
int main()
{
	int N;
	int a[15]={0};
	int i=0;
	int num=0,left;
	printf("Input n:");
	scanf("%d",&N);
	for(i=0;i<N;i++) a[i]=i+1;
	left=N;
	while(1)
	{
		if(i==N) i=0;
		if(left==1) break;
		else if(a[i]!=0) num++;
		if((num%3==0)&&(a[i]!=0))
		{
			a[i]=0;
			left--;
		}
		i++;
	}
	for(i=0;i<N;i++)
	if(a[i]) printf("%d",a[i]);
	return 0;
}
