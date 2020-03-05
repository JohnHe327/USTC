#include <stdio.h>
#include <string.h>
int judge(int start,int end);
int min(int x,int y);

char String[1001];
int cut[1001];
int main()
{
	int ROW;
	scanf("%d",&ROW);
	getchar();
	int len;
	for(int count=0;count<ROW;count++)
	{
		gets(String);
		len=strlen(String);
		cut[0]=-1;
		for(int i=1;i<=len;i++) cut[i]=99999;
		
		for(int i=0;i<len;i++)
		for(int j=0;j<=i;j++)
		if(judge(j,i))
		cut[i+1]=min(cut[i+1],cut[j]+1);
		
		printf("Case %d: %d\n",count+1,cut[len]+1);
	}
	return 0;
}

int judge(int start,int end)
{
	for(int i=0;start+i<=end-i;i++)
	if(String[start+i]!=String[end-i])
	return 0;
	return 1;
}

int min(int x,int y)
{
	if(x<y) return x;
	return y;
}
