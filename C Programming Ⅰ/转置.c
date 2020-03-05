#include <stdio.h>
int f(int i,int j);
int a[3][3];
int main()
{
	int i,j;
	int b[3][3];
	printf("Input array\n");
	for(i=0;i<3;i++)
	for(j=0;j<3;j++)
	scanf("%d",&a[i][j]);
	
	for(i=0;i<3;i++)
	for(j=0;j<3;j++)
	b[i][j]=f(i,j);
	
	for(i=0;i<3;i++)
	{
		for(j=0;j<3;j++)
		printf("%2d ",b[i][j]);
		printf("\n");
	}
	return 0;
}

int f(int i,int j)
{
	return(a[j][i]);	
}
