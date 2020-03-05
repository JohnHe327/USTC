#include <stdio.h>
 int main()
{
	int max(int a,int b,int c);
	int x,y,z,m;
	scanf("%d%d%d",&x,&y,&z);
	m=max(x,y,z);
	printf("max=%d\n",m);
	return 0;
}

int max(int a,int b,int c)
{
	int d;
	if(a>b)
	 if(a>c)d=a;
	 else d=c;
	else
	 if(b>c)d=b;
	 else d=c;
	return(d);
}
