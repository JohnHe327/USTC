#include <stdio.h>
int main()
{
	int str[100];
	int i=0,j=0;
	for(i=0;i<100;i++)
	str[i]=i+1;
	
	for(i=0;i<100;i++)
	{
		if(str[i]!=1)
		for(j=i+1;j<100;j++)
		if(str[j]%str[i]==0) str[j]=1; 
	}
	
	for(i=0;i<100;i++)
	if(str[i]!=1) printf("%d ",str[i]);
	return 0;
}
