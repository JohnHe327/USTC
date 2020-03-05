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
void SortLinkList(StuIfo *head);

int main()
{
	FILE *out;
	StuIfo *head,*p;
	int j;
	
	head=CreatLinkList();
	SortLinkList(head);
	p=head->next;
	
	if((out=fopen("stu_sort.txt","w"))==NULL)
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
	
	if((in=fopen("stud.txt","r"))==NULL)
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

void SortLinkList(StuIfo *head)
{
	StuIfo *p,*q,*r;
	int i,j=0;
	
	p=head;
	if(p->next==NULL)
	{
		printf("No data.");
		return;
	}
	while(p->next!=NULL)
	{
		j++;
		p=p->next;
	}
	for(i=0;i<j-1;i++)
	{
		p=head;
		q=p->next;
		r=q->next;
		while(q->next!=NULL)
		{
			if(q->aver<r->aver)
			{
				q->next=r->next;
				r->next=q;
				p->next=r;
			}
			p=p->next;
			q=p->next;
			r=q->next;
		}
	}
}
