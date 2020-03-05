#include <stdio.h>
#include <string.h>
#define N 10
void sort(char (*p_a)[20]);
int main()
{
	char a[N][20];
	int i;
	printf("Input 10 arrays:\n");
	for(i=0;i<N;i++) gets(a[i]);
	printf("\n\n\n");
	sort(a);
	for(i=0;i<N;i++)
	printf("%s\n",a[i]);
	return 0;
}

void sort(char b[][20])
{
	int i,j;
	char temp[20];
	for(j=0;j<N-1;j++)
	for(i=0;i<N-1;i++)
	if(((strlen(b[i])==strlen(b[i+1]))&&(strcmp(b[i],b[i+1])>0))||(strlen(b[i])>strlen(b[i+1])))
	{
		strcpy(temp,b[i]);
		strcpy(b[i],b[i+1]);
		strcpy(b[i+1],temp);
	}
}
