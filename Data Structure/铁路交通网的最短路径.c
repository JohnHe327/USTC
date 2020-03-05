#include <stdio.h>
#include <stdlib.h>
#define MAX_VNUM 5000
#define SHORT_MAX 32765
short G[MAX_VNUM+1][MAX_VNUM+1];
int main()
{
	//freopen("in9.txt","r",stdin);
	short vnum;
	int anum;
	scanf("%hd %d",&vnum,&anum);
	
	for(int i=1;i<=vnum;i++)
	for(int j=1;j<=vnum;j++)
	G[i][j]=SHORT_MAX;
	
	short a,b,l;
	for(int i=1;i<=anum;i++){
		scanf("%hd %hd %hd",&a,&b,&l);
		G[a][b]=G[b][a]=l;
	}
	
	short s,t;
	scanf("%hd %hd",&s,&t);
	
	short D[vnum+1],final[vnum+1];
	for(int i=1;i<=vnum;i++){
		final[i]=0;
		D[i]=G[s][i];
	}
	D[s]=0;
	final[s]=1;
	int i,w,v;
	for(i=1;i<vnum;i++){
		short min=SHORT_MAX;
		for(w=1;w<=vnum;w++)
			if(!final[w])
				if(D[w]<min){
					v=w;min=D[w];
				}
		final[v]=1;
		for(w=1;w<=vnum;w++) 
			if(!final[w] && (min+G[v][w])<D[w]) 
				D[w]=min+G[v][w];
	}
	
	printf("%hd",D[t]);
	return 0;
}

