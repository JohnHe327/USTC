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
void InsertLinkList(StuIfo *head);

int main()
{
	FILE *out;
	StuIfo *head,*p;
	int j;
	
	head=CreatLinkList();
	InsertLinkList(head);
	p=head->next;
	
	if((out=fopen("stu_sort_inserted.txt","w"))==NULL)
	{
		printf("Cannot open.");
		exit(0);
	}

	while(p!=NULL)
	{
		fprintf(out,"%5d%10s ",p->ID,p->name);
		for(j=0;j<SCORE;j++) fprintf(out,"%3d ",p->score[j]);
		fprintf(out,"%.1f\n",p->aver);
		p=p->next;
	}
	
	fclose(out);
	return 0;
}

StuIfo *CreatLinkList()
{
	StuIfo *head,*pnew,*tail;
	FILE *in;
	int i,j;
	
	head=(StuIfo *)malloc(sizeof(StuIfo));
	if(head==NULL)
	{
		printf("No enough memory!");
		exit(0);
	}
	head->next=NULL;
	tail=head;
	
	if((in=fopen("stu_sort.txt","r"))==NULL)
	{
		printf("Cannot open.");
		exit(0);
	}
	
	for(i=0;i<STUDENT;i++)
	{
		pnew=(StuIfo *)malloc(sizeof(StuIfo));
		if(pnew==NULL)
		{
			printf("No enough memory!");
			exit(0);
		}
		
		fscanf(in,"%d%10s",&pnew->ID,pnew->name);
		for(j=0;j<SCORE;j++) fscanf(in,"%d",&pnew->score[j]);
		fscanf(in,"%f",&pnew->aver);
		
		pnew->next=NULL;
		tail->next=pnew;
		tail=pnew;
	}
	fclose(in);
	return(head);
}

void InsertLinkList(StuIfo *head)
{
	StuIfo *pnew,*p,*q;
	int j;
	
	p=head;
	q=p->next;
	
	pnew=(StuIfo *)malloc(sizeof(StuIfo));
	if(pnew==NULL)
	{
		printf("No enough memory!");
		exit(0);
	}
	
	printf("Input a new student information:\n");
	scanf("%d%10s",&pnew->ID,pnew->name);
	for(j=0;j<SCORE;j++)
	{
		scanf("%d",&pnew->score[j]);
		pnew->aver+=pnew->score[j];
	}
	pnew->aver/=3.0;
	
	while(q!=NULL)
	{
		if(q->aver>pnew->aver)
		{
			p=p->next;
			q=p->next;
			continue;
		}
		else
		{
			pnew->next=q;
			p->next=pnew;
			return;
		}
	}
	p->next=pnew;
	pnew->next=NULL;
}











