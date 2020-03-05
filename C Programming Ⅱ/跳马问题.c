#include <stdio.h>
#define MAX 50

int map[MAX][MAX]={1};
int N,count=0;
long long int total=0;
int pace[MAX*MAX+1][2];

int InMap(int i,int j);
void jump(int row,int col);
void Print();

int main()
{
	printf("格点数：");
	scanf("%d",&N);
	jump(0,0);
	printf("总方法数：%lld",total);
	getchar(); 
	getchar();
	return 0;
}

int InMap(int i,int j)
{
	if(i>=0&&i<N&&j>=0&&j<N) return 1;
	else return 0;
}

void jump(int row,int col)
{
	map[row][col]=++count;
	pace[count][0]=row;
	pace[count][1]=col;
	if(count==N*N) total++;
	
	if(InMap(row+1,col+2)&&map[row+1][col+2]==0) jump(row+1,col+2);
	if(InMap(row+2,col+1)&&map[row+2][col+1]==0) jump(row+2,col+1);
	if(InMap(row+2,col-1)&&map[row+2][col-1]==0) jump(row+2,col-1);
	if(InMap(row+1,col-2)&&map[row+1][col-2]==0) jump(row+1,col-2);
	if(InMap(row-1,col-2)&&map[row-1][col-2]==0) jump(row-1,col-2);
	if(InMap(row-2,col-1)&&map[row-2][col-1]==0) jump(row-2,col-1);
	if(InMap(row-2,col+1)&&map[row-2][col+1]==0) jump(row-2,col+1);
	if(InMap(row-1,col+2)&&map[row-1][col+2]==0) jump(row-1,col+2);
	
	if(count==N*N)	Print();
	
	count--;
	map[row][col]=0;
}

void Print()
{
	printf("(0,0)");
	for(int i=2;i<=count;i++)
	{
		printf("--(%d,%d)",pace[i][0],pace[i][1]);
	}
	printf("\n\n");
}
