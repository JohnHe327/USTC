#include <stdio.h>
int R,C;
int h[100][100];
int lenth[100][100]={0};

int InMap(int r,int c);
int FindMax(int row,int col);
int max(int x,int y);

int main()
{
	int Max=0;
	scanf("%d%d",&R,&C);
	for(int row=0;row<R;row++)
	for(int col=0;col<C;col++)
	scanf("%d",&h[row][col]);
	
	for(int r=0;r<R;r++)
	for(int c=0;c<C;c++)
	Max=max(Max,FindMax(r,c));
	
	printf("%d",Max);
}

int FindMax(int row,int col)
{
	if(lenth[row][col]==0)
	{
	lenth[row][col]=1;
	if(InMap(row,col-1)&&h[row][col-1]<h[row][col])
		lenth[row][col]=max(lenth[row][col],FindMax(row,col-1)+1);
	if(InMap(row-1,col)&&h[row-1][col]<h[row][col])
		lenth[row][col]=max(lenth[row][col],FindMax(row-1,col)+1);
	if(InMap(row,col+1)&&h[row][col+1]<h[row][col])
		lenth[row][col]=max(lenth[row][col],FindMax(row,col+1)+1);
	if(InMap(row+1,col)&&h[row+1][col]<h[row][col])
		lenth[row][col]=max(lenth[row][col],FindMax(row+1,col)+1);
	}

	return lenth[row][col];
}

int max(int x,int y)
{
	if(x>y) return x;
	return y;
}

int InMap(int r,int c)
{
	return (r>=0&&r<R&&c>=0&&c<C);
}
