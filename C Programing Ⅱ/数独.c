#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <stdbool.h>

int question[9][9],answer[9][9];
bool taken[3][9][9],solved[9][9];
int count;

void Creat(void);
void Solve(int row,int col);
void Input(void);
int InBox(int row,int col);
void Mark(int row,int col,bool status);
void Print(int sudoku[][9]);
int GetAns(int row,int col,int start);

int main()
{while(1){
	for(int i=0;i<81;i++)
	{
		*(*(question)+i)=-1;
		*(*(answer)+i)=-1;
		*(*(*(taken+0))+i)=false;
		*(*(*(taken+1))+i)=false;
		*(*(*(taken+2))+i)=false;
		*(*(solved)+i)=false;
		count=0; 
	}
	printf("Choose function:\n1.Creat Sudoku\n2.Solve Sudoku\n3.exit\n");
	switch(getchar())
	{
		case '1':
			while(getchar()!='\n') continue;
			Creat();
			Print(question);
			printf("Press 1 to show answer\n");
			if(getchar()=='1')
			Print(answer);
			break;
		case '2':
			while(getchar()!='\n') continue;
			Input();
			Solve(0,0);
			Print(answer);
			break;
		case '3':
			printf("Goodbye!");
	 		exit(0);
	}
	while(getchar()!='\n') continue;
}}

void Creat()
{
	srand(time(0));
	int temp1,temp2,temp3;
	temp1=*(*(answer))=rand()%6+3;
	while((temp2=rand()%6+1)==temp1) continue;
	*(*(answer)+27)=temp2;
	while((temp3=rand()%7+1)!=temp2)
	if(temp3==temp1) continue;
	else
	{
		*(*(answer)+54)=temp3;
		break;
	}
	
	for(int i=0;i<9;i++)
	{
		for(int j=0;j<9;j++)
		{
			if(answer[i][j]!=-1)
			{
				Mark(i,j,1);
				solved[i][j]=true;
			}
			else
			{
				solved[i][j]=false;
			}
		}
	}
	
	Solve(0,0);
	for(int i=0;i<81;i++)
	*(*(question)+i)=*(*(answer)+i);
	for(int i=0;i<81;i++)
	*(*(question)+rand()%81)=-1;
}

void Input()
{
	for(int i=0;i<9;i++)
	{
		for(int j=0;j<9;j++)
		{
			question[i][j]=getchar()-'0';
			if(question[i][j]!=0)
			{
				question[i][j]--;
				answer[i][j]=question[i][j];
				Mark(i,j,1);
				solved[i][j]=true;
			}
			else
			{
				question[i][j]--;
				solved[i][j]=false;
			}
		}
		getchar();
	}
	//Print(question);
}

void Solve(int row,int col)
{
	if(col==9)
	{
		row++;
		col=0;
	}
	while(row<9 && solved[row][col]==true)
	{
		col++;
		if(col==9)
		{
			row++;
			col=0;
		}
	}
	if(row==9)
	{
		count++;
		return;
	}
	
	while((answer[row][col]=GetAns(row,col,answer[row][col]+1))!=-1)
	{
		Mark(row,col,1);
		Solve(row,col+1);
		if(count) break;
		Mark(row,col,0);
	}
}

int InBox(int row,int col)
{
	return row/3*3+col/3;
}

void Mark(int row,int col,bool status)
{
	taken[0][row][answer[row][col]]=status;
	taken[1][col][answer[row][col]]=status;
	taken[2][InBox(row,col)][answer[row][col]]=status;
}

int GetAns(int row,int col,int start)
{
	for(int i=start;i<9;i++)
	if(taken[0][row][i]==false && taken[1][col][i]==false && taken[2][InBox(row,col)][i]==false)
	return i;
	return -1;
}

void Print(int sudoku[][9])
{
	if(count!=0)
	{
		for(int i=0;i<9;i++)
		{
			if(i%3==0) printf("-------------\n");
			for(int j=0;j<9;j++)
			{
				if(j%3==0) putchar('|');
				if(*(*(sudoku+i)+j)!=-1)
					printf("%d",1+*(*(sudoku+i)+j));
				else printf(" ");
			}
			printf("|\n");
		}
		printf("-------------\n\n\n");
	}
	else printf("No answer.\n\n\n");
}
