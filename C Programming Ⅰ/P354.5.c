#include <stdio.h>
#include <stdlib.h>
#define STUDENT 3
#define SCORE 3
typedef struct STUIFO
{
	struct STUIFO *next;
	int ID;
	char name[10];
	int score[SCORE];
	float aver;
} StuIfo;
StuIfo *CreatLinkList();

int main()
{
	FILE *fp;
	StuIfo *head,*p;
	int j;
	
	head=CreatLinkList();
	p=head->next;
	
	if((fp=fopen("stud.txt","w"))==NULL)
	{
		printf("Cannot open.");
		exit(0);
	}
	
	while(p!=NULL)
	{
		fprintf(fp,"%5d%10s ",p->ID,p->name);
		for(j=0;j<SCORE;j++) fprintf(fp,"%3d ",p->score[j]);
		fprintf(fp,"%.1f\n",p->aver);
		p=p->next;
	}
	fclose(fp);
	return 0;
}

StuIfo *CreatLinkList()
{
	StuIfo *head,*pnew,*tail;
	int i,j;
	
	head=(StuIfo *)malloc(sizeof(StuIfo));
	if(head==NULL)
	{
		printf("No enough memory!");
		exit(0);
	}
	head->next=NULL;
	tail=head;
	
	for(i=0,printf("Input number,name,scores:\n");i<STUDENT;i++)
	{
		pnew=(StuIfo *)malloc(sizeof(StuIfo));
		if(pnew==NULL)
		{
			printf("No enough memory!");
			exit(0);
		}
		
		scanf("%d%s",&pnew->ID,pnew->name);
		for(j=0;j<SCORE;j++)
		{
			scanf("%d",&pnew->score[j]);
			pnew->aver+=pnew->score[j];
		}
		pnew->aver/=3.0;
		
		tail->next=pnew;
		pnew->next=NULL;
		tail=pnew;
	}
	return(head);
}
