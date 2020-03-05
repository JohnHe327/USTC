#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#define M 3 
#define N 3
#define MAX 100 
int cmp_min(int *p_m,int *p_row);
int cmp_max(int *p_m,int *p_line);
int main()
{
	int a[M][N]/*={{1,2,3},{4,5,6},{7,8,9}}*/;
	int i,j;
	
	srand(time(0));
	for(i=0;i<M;i++)
	for(j=0;j<N;j++)
	a[i][j]=rand()%MAX;//¸³Öµ 
	
	for(i=0;i<M;i++)
	{
		for(j=0;j<N;j++)
		printf("%3d ",a[i][j]);
		printf("\n");
	}//Êä³ö 
	
	for(i=0;i<M;i++)
	for(j=0;j<N;j++)
	if(cmp_min(&a[i][j],*a+j)&&cmp_max(&a[i][j],a[i]))		//if(cmp_min(&a[i][j],&a[0][j])&&cmp_max(&a[i][j],&a[i][0]))
	printf("%d(line%d,row%d) is a saddle point.\n",a[i][j],i+1,j+1);
}

int cmp_max(int *p_m,int *p_line)
{
	int *i=p_m,*j=p_line;
	int flag=1;
	for(j=p_line;j<p_line+N;j++)
	if(*i<*j) flag=0;
	return(flag);
}

int cmp_min(int *p_m,int *p_row)
{
	int *i=p_m,*j=p_row;
	int flag=1;
	for(j=p_row;j<p_row+M*N;j+=N)
	if(*i>*j) flag=0;
	return(flag);
}
