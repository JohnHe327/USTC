#include <stdio.h>
void dfs(int i,int j);
int able=0;
int n;
int ha,la,hb,lb;
char maze[100][100];
int check[100][100];

int main()
{
	int turn;
	scanf("%d",&turn);
	while(turn--)
	{
		able=0;
		scanf("%d",&n);
		while(getchar()!='\n') continue;
		
		for(int i=0;i<n;i++)
		{
			for(int j=0;j<n;j++)
			maze[i][j]=getchar();
			getchar();
		}
		
		scanf("%d%d%d%d",&ha,&la,&hb,&lb);
		
		for(int i=0;i<n;i++)
		for(int j=0;j<n;j++)
		if(maze[i][j]=='#') check[i][j]=1;
		else check[i][j]=0;
		
		if(maze[ha][la]=='#'||maze[hb][lb]=='#')
		{
			printf("NO\n");
			continue;
		}
		
		if(ha>=0&&ha<n&&la>=0&&la<n)
		dfs(ha,la);
		
		if(able) printf("YES\n");
		else printf("NO\n");
	}
}

void dfs(int i,int j)
{
	check[i][j]=1;
	if(i==hb&&j==lb)
	able=1;

	if(check[i][j-1]==0&&(j-1)>=0&&(j-1)<n) dfs(i,j-1);
	if(check[i-1][j]==0&&(i-1)>=0&&(i-1)<n) dfs(i-1,j);
	if(check[i][j+1]==0&&(j+1)>=0&&(j+1)<n) dfs(i,j+1);
	if(check[i+1][j]==0&&(i+1)>=0&&(i+1)<n) dfs(i+1,j);
}
