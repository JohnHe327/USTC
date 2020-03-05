#include <stdio.h>
#include <stdlib.h>
#define MAX_VNUM 35
int visited[MAX_VNUM]={0}; 

void DFS(int G[MAX_VNUM][MAX_VNUM],const int vnum,int start)
{
	visited[start]=1;
	printf("%d ",start);
	for(int i=1;i<=vnum;i++){
		if(G[start][i]&&!visited[i]) DFS(G,vnum,i);
	} 
}

void BFS(int G[MAX_VNUM][MAX_VNUM],const int vnum,int start)
{
	int Q[MAX_VNUM+10]={0};
	int Qhead=0,Qtail=0;
	visited[start]=1;
	Q[Qtail++]=start;
	while(Qhead!=Qtail){
		printf("%d ",Q[Qhead]);
		for(int i=1;i<=vnum;i++){
			if(G[Q[Qhead]][i]&&!visited[i]){
				visited[i]=1;
				Q[Qtail++]=i;
			}
		}
		Qhead++;
	}
}
int main()
{
	int vnum,anum,start;
	int a,b;
	int G[MAX_VNUM][MAX_VNUM]={0};
	scanf("%d%d",&vnum,&anum);
	for(int i=1;i<=anum;i++){
		scanf("%d%d",&a,&b);
		G[a][b]=1;
		G[b][a]=1;
	}
	scanf("%d",&start);
	DFS(G,vnum,start);
	
	for(int i=0;i<MAX_VNUM;i++)	visited[i]=0;
	printf("\n");
	BFS(G,vnum,start);
	return 0;
}

