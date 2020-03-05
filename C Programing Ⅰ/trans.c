#include <stdio.h>
#define N 9
void trans(int *p_a,int m);
int main()
{
	int i;
	int a[N];
	int m;
	printf("Input a[%d]\n",N);
	for(i=0;i<N;i++) scanf("%d",&a[i]);
	printf("\nInput m:");
	scanf("%d",&m);
	trans(a,m);
	printf("\n\n");
	for(i=0;i<N;i++) printf("%d ",a[i]);
	return 0;
}

void trans(int *p_a,int m)
{
	int i;
	int b[N];
	
	for(i=0;i<N-m;i++) b[i]=*(p_a+i);
	for(;i<N;i++) *(p_a+i-N+m)=*(p_a+i);
	for(i=m;i<N;i++) *(p_a+i)=b[i-m];
}
