#include <stdio.h>
void dfs(int i,int j);
int max=0,size=0,roomcount=0;
int row,col;
int castle[50][50],check[50][50];
int wall[50][50][4];

int main()
{
	scanf("%d%d",&row,&col);
	for(int i=0;i<row;i++)
	for(int j=0;j<col;j++)
	{
		scanf("%d",&castle[i][j]);
		check[i][j]=0;
	}
	
	for(int i=0;i<row;i++)
	for(int j=0;j<col;j++)
	{
		if(castle[i][j]>=8)
		{
			wall[i][j][3]=1;
			castle[i][j]-=8;
		}
		else wall[i][j][3]=0;
		
		if(castle[i][j]>=4)
		{
			wall[i][j][2]=1;
			castle[i][j]-=4;
		}
		else wall[i][j][2]=0;
		
		if(castle[i][j]>=2)
		{
			wall[i][j][1]=1;
			castle[i][j]-=2;
		}
		else wall[i][j][1]=0;
		
		if(castle[i][j]>=1)
		{
			wall[i][j][0]=1;
			castle[i][j]-=1;
		}
		else wall[i][j][0]=0;
	}
	
	for(int i=0;i<row;i++)
	for(int j=0;j<col;j++)
	{
		if(check[i][j]==0)
		{
			roomcount++;
			size=0;
			dfs(i,j);
			if(size>max) max=size;
		}
	}
	
	printf("%d\n%d",roomcount,max);
	return 0;
}

void dfs(int i,int j)
{
	check[i][j]=1;
	size++;
	if(wall[i][j][0]==0&&check[i][j-1]==0) dfs(i,j-1);
	if(wall[i][j][1]==0&&check[i-1][j]==0) dfs(i-1,j);
	if(wall[i][j][2]==0&&check[i][j+1]==0) dfs(i,j+1);
	if(wall[i][j][3]==0&&check[i+1][j]==0) dfs(i+1,j);
}
