#include <stdio.h>
#include <stdlib.h>
#include <string.h>
typedef struct STUIFO
{
	struct STUIFO *next;
	char num[10];
	int score;
}stuifo;
stuifo *CreatLinkList();
void CatLinkList(stuifo *a,stuifo *b);
void SortLinkList(stuifo *a);

int main()
{
	stuifo *a,*b,*p;
	a=CreatLinkList();
	b=CreatLinkList();
	CatLinkList(a,b);
	SortLinkList(a);
	p=a->next;
	while(p!=NULL)
	{
		printf("%10s-----%3d\n",p->num,p->score);
		p=p->next;
	}
	return 0;
}

stuifo *CreatLinkList()
{
	char temp[10];
	int score;
	stuifo *head,*pnew,*tail;
	head=(stuifo *)malloc(sizeof(stuifo));
	if(head==NULL)
	{
		printf("No enough memory!");
		return(NULL);
	}
	head->next=NULL;
	tail=head;
	
	printf("Input number,score:\n");
	while(1)
	{
		scanf("%s%d",temp,&score);
		if(score<0)
		{
			printf("\n\n");
			break;
		}
		pnew=(stuifo *)malloc(sizeof(stuifo));
		if(pnew==NULL)
		{
			printf("No enough memory!");
			return(NULL);
		}
		strcpy(pnew->num,temp);
		pnew->score=score;
		pnew->next=NULL;
		tail->next=pnew;
		tail=pnew;
	}
	return(head);
}

void CatLinkList(stuifo *a,stuifo *b)
{
	stuifo *p_a,*p_b;
	p_a=a;
	p_b=b;
	while(p_a->next!=NULL) p_a=p_a->next;
	p_b=p_b->next;
	p_a->next=p_b;
}

void SortLinkList(stuifo *a)
{
	stuifo *p,*q,*r,*temp;
	int i=0,j;
	p=a;
	if(p->next==NULL)
	{
		printf("No data.");
		return;
	}
	while(p->next!=NULL)
	{
		i++;
		p=p->next;
	}
	for(j=0;j<i-1;j++)
	{
	p=a;
	q=p->next;
	r=q->next;
	while(q->next!=NULL)
	{
		if(strcmp(q->num,r->num)>0)
		{
			temp=r;
			q->next=r->next;
			r->next=p->next;
			p->next=temp;
		}
		p=p->next;
		q=p->next;
		r=q->next;
	}
	}
}
