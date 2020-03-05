#include <stdio.h>
#include <memory.h>
#include <stdlib.h>
#include <stdbool.h> 
#define MAX 1010
#define INF 1267514
int max;
typedef struct PLATFORM
{
	int lx,rx,h;
}Platform;

Platform PF[MAX+10];
int aLMT[MAX+10];
int aRMT[MAX+10];
int turn,n;
int x,y;
int time;

int mCompare(void *e1,void *e2);
int MiniTime(int p,bool Left);

int main()
{
	int temp=0;
	scanf("%d",&turn);
	for(int i=0;i<turn;i++)
	{
		time=temp;
		memset(aLMT,-1,sizeof(aLMT));
		memset(aRMT,-1,sizeof(aRMT));
		scanf("%d%d%d%d",&n,&x,&y,&max);
		PF[0].h=y;
		PF[0].lx=x;
		PF[0].rx=x;

		for(int j=1;j<=n;j++)
		{
			scanf("%d%d%d",&PF[j].lx,&PF[j].rx,&PF[j].h);
			time++;
		}
		qsort(PF,n+1,sizeof(Platform),mCompare);
		time=MiniTime(0,1);
		printf("%d\n",time);
		temp++;
	}
	return 0;
}

int MiniTime(int p,bool Left)
{
	int x;
	int i;
	if(Left) x=PF[p].lx;
	else x=PF[p].rx;
	for(i=p+1;i<=n;i++)
	if(PF[i].lx<=x&&PF[i].rx>=x)
	break;
	
	int y=PF[p].h;
		
	if(i<=n)
	{
		if(y-PF[i].h>max) return INF;
	}
	else
	{
		if(y>max) return INF;
		else return y;
	}
	
	int nRT=y-PF[i].h+PF[i].rx-x;
	int nLT=y-PF[i].h+x-PF[i].lx;
	
	if(aLMT[i]==-1) aLMT[i]=MiniTime(i,1);
	if(aRMT[i]==-1) aRMT[i]=MiniTime(i,0);
	
	nRT+=aRMT[i];
	nLT+=aLMT[i];
	
	if(nLT>nRT) return nRT;
	return nLT;
}

int mCompare(void *e1,void *e2)
{
	Platform *p1;
	Platform *p2;
	p1=(Platform *)e1;
	p2=(Platform *)e2;
	return p2->h - p1->h;
}
