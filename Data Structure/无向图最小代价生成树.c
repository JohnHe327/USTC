#include <stdio.h>
#include <stdlib.h>
#define MAX_VNUM 9000
#define SHORT_MAX 32765
short G[MAX_VNUM+1][MAX_VNUM+1];
struct {
	short v;
	short lowcost;
}closedge[MAX_VNUM+5];

int main()
{
	//freopen("in9.txt","r",stdin);
	long int sum=0;
	short vnum;
	int anum;
	scanf("%hd%d",&vnum,&anum);
	
	for(int i=1;i<=vnum;i++)
	for(int j=1;j<=vnum;j++)
	G[i][j]=SHORT_MAX;
	
	short a,b,l;
	for(int i=1;i<=anum;i++){
		scanf("%hd%hd%hd",&a,&b,&l);
		G[a][b]=G[b][a]=l;
	}
	
	for(int j=1;j<=vnum;j++){
		closedge[j].v=1;
		closedge[j].lowcost=G[1][j];
	}
	closedge[1].lowcost=0;
	
	for(int i=1;i<vnum;i++){
		short minj=1,minarc=SHORT_MAX,j;
		for(j=1;j<=vnum;j++){
			if(closedge[j].lowcost>0 && closedge[j].lowcost < minarc){
				minj=j;
				minarc=closedge[minj].lowcost;
			}
		}
		sum+=minarc;
		closedge[minj].lowcost=0;
		for(int j=1;j<=vnum;j++)
		if(closedge[j].lowcost > G[minj][j]){
			closedge[j].v=minj;
			closedge[j].lowcost=G[minj][j];
		}
	}
	
	printf("%ld",sum);
	return 0;
}

