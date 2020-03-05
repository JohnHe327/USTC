#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#define S 10
void sort(int a[]);
int main()
{
	int str[S]={0};
	int i=0;
	srand(time(0));
	for(i=1;i<S;i++) str[i]=rand()%100;
	for(i=1;i<S;i++) printf("%2d ",str[i]);//输出原数组 
	printf("\n");
	sort(str);
	for(i=1;i<S;i++) printf("%2d ",str[i]);//输出排序后数组

	printf("\nInput a integer:");
	scanf("%d",&str[0]);
	sort(str);
	for(i=0;i<S;i++) printf("%2d ",str[i]);//输出新数组 
	return 0;
}

void sort(int *p_str)
{
	int *i=p_str;
	int j,temp;
	for(j=0;j<S-1;j++)
	for(i=p_str;i<p_str+S-1;i++)
	if(*i>*(i+1))
	{
		temp=*i;
		*i=*(i+1);
		*(i+1)=temp;
	}
}
