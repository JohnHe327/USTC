#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#define M 11
#define N 6
void average_student(int (*p_a)[N]);
void average_course(int (*p_a)[N]);
void max(int (*p_a)[N]);
void varience(int (*p_a)[N]);
int main()
{
	int a[M][N]={0};
	int i,j;
	
	srand(time(0));
	for(i=1;i<M;i++)
	for(j=1;j<N;j++)
	a[i][j]=rand()%100;
	//scanf("%d",&a[i][j]);
	
	
	for(i=1;i<M;i++)
	{
		for(j=1;j<N;j++)
		printf("%2d ",a[i][j]);
		printf("\n");
	}
	printf("\n");
	
	back:
	printf("\nChoose function:\n1.average_student  2.average_course\n3.max              4.varience\n");
	switch(getchar())
	{
		case '1':
			average_student(a);
			break;
		case '2':
			average_course(a);
			break;
		case '3':
			max(a);
			break;
		case '4':
			varience(a);
			break;
	}
	if(getchar()=='\n')
	{
		for(i=0;i<M;i++) a[i][0]=0;
		for(j=0;j<N;j++) a[0][j]=0;
		goto back;
	}
	return 0;
}

void average_student(int (*p_a)[N])
{
	int i,j;
	float aver;
	for(i=1;i<M;i++)
	{
		for(j=1;j<N;j++) *(*(p_a+i))+=*(*(p_a+i)+j);
		aver=*(*(p_a+i))/(N-1.0);
		printf("Student %2d: %.1f\n",i,aver);
	}
}

void average_course(int (*p_a)[N])
{
	int i,j;
	float aver;
	for(j=1;j<N;j++)
	{
		for(i=1;i<M;i++) *(*(p_a)+j)+=*(*(p_a+i)+j);
		aver=*(*(p_a)+j)/(M-1.0);
		printf("Course %d: %.1f\n",j,aver);
	}
}

void max(int (*p_a)[N])
{
	int i,j;
	int max,maxi,maxj;
	max=*(*(p_a+1)+1);
	i=1;j=1;
	for(i=1;i<M;i++)
	for(j=1;j<N;j++)
	if(*(*(p_a+i)+j)>max)
	{
		max=*(*(p_a+i)+j);
		maxi=i;
		maxj=j;
	}
	printf("The higest score is %d(student%d course %d).\n",max,maxi,maxj);
}

void varience(int (*p_a)[N])
{
 	int i,j;
	float temp1=0,temp2=0;
	float sigma;
	
	for(i=1;i<M;i++)
	{
		for(j=1;j<N;j++)
		*(*(p_a+i))+=*(*(p_a+i)+j);
		temp1+=((*(*(p_a+i)))/(N-1.0))*((*(*(p_a+i)))/(N-1.0));
		temp2+=*(*(p_a+i))/(N-1.0);
	}
	temp2/=M-1.0;
	sigma=temp1/(M-1.0)-temp2*temp2;
	printf("The varience is %.2f.\n",sigma);
}

