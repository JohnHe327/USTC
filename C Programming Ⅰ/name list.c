#include <stdio.h>
#include <string.h>
#define SUM 10
void input(char (*p_list)[2][20]);
void sort(char (*p_list)[2][20]);
void find(char (*p_list)[2][20],char *p_goal);
int main()
{
	char list[SUM][2][20];
	char goal[20];
	input(list);
	sort(list);
	printf("输入要查找的职工号：");
	scanf("%20s",goal);
	find(list,goal);
	return 0;
}

void input(char (*p_list)[2][20])
{
	int i;
	printf("输入职工姓名、职工号\n");
	for(i=0;i<SUM;i++)
	scanf("%20s%20s",*(*(p_list+i)+0),*(*(p_list+i)+1));
	
	for(i=0;i<SUM;i++)
	printf("%10s--%s\n",*(*(p_list+i)+0),*(*(p_list+i)+1));
	printf("\n\n\n");
}

void sort(char (*p_list)[2][20])
{
	int i,j;
	char temp[20];
	for(j=0;j<SUM-1;j++)
	for(i=0;i<SUM-1;i++)
	if(strcmp(*(*(p_list+i)+1),*(*(p_list+i+1)+1))>0)
	{
		strcpy(temp,*(*(p_list+i)+1));
		strcpy(*(*(p_list+i)+1),*(*(p_list+i+1)+1));
		strcpy(*(*(p_list+i+1)+1),temp);
		strcpy(temp,*(*(p_list+i)));
		strcpy(*(*(p_list+i)),*(*(p_list+i+1)));
		strcpy(*(*(p_list+i+1)),temp);
	}
	
	for(i=0;i<SUM;i++)
	printf("%10s--%s\n",*(*(p_list+i)+0),*(*(p_list+i)+1));
	printf("\n\n\n");
}

void find(char (*p_list)[2][20],char *p_goal)
{
	int min=0,max=SUM-1,mid;
	int flag=0;
	mid=(max+min)/2;
	
	while(max!=min+1)
	{
		if(strcmp(*(*(p_list+mid)+1),p_goal)>0)
		{
			max=mid;
			mid=(max+min)/2;
		}
		else if(strcmp(*(*(p_list+mid)+1),p_goal)<0)
		{
			min=mid;
			mid=(max+min)/2;
		}
		else
		{
			printf("%s",*(*(p_list+mid)));
			flag=1;
			break;
		}
	}
	if(flag==0)
	{
		if(strcmp(*(*(p_list+min)+1),p_goal)==0) printf("%s",*(*(p_list+min)));
		else if(strcmp(*(*(p_list+max)+1),p_goal)==0) printf("%s",*(*(p_list+max)));
		else printf("未找到");
	}
}
