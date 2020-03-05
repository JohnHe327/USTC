#include <stdio.h>
#include <stdlib.h>
#include <string.h>
typedef struct STUIFO
{
	struct STUIFO *next;
	char num[10];
	char name[20];
}stuifo;
stuifo *CreatLinkList();
void CheckLinkList(stuifo *a,stuifo *b);

int main()
{
	stuifo *a,*b,*p;
	a=CreatLinkList();
	b=CreatLinkList();
	CheckLinkList(a,b);
	
	p=a->next;
	while(p!=NULL)
	{
		printf("%10s-----%s\n",p->num,p->name);
		p=p->next;
	}
	return 0;
}

stuifo *CreatLinkList()
{
	char temp[10];
	char name[20];
	stuifo *head,*pnew,*tail;
	head=(stuifo *)malloc(sizeof(stuifo));
	if(head==NULL)
	{
		printf("No enough memory!");
		return(NULL);
	}
	head->next=NULL;
	tail=head;
	
	printf("Input number,name:\n(end with '%c')\n",'#');
	while(1)
	{
		scanf("%s",temp);
		if(strcmp(temp,"#")==0)
		{
			printf("\n\n");
			break;
		}
		scanf("%s",name);
		pnew=(stuifo *)malloc(sizeof(stuifo));
		if(pnew==NULL)
		{
			printf("No enough memory!");
			return(NULL);
		}
		strcpy(pnew->num,temp);
		strcpy(pnew->name,name);
		pnew->next=NULL;
		tail->next=pnew;
		tail=pnew;
	}
	return(head);
}

void CheckLinkList(stuifo *a,stuifo *b)
{
	stuifo *p_a,*q_a,*p_b;
	p_a=a;
	q_a=p_a->next;
	p_b=b;
	while(q_a!=NULL)
	{
		while(q_a!=NULL&&p_b!=NULL)
		{
			if(strcmp(q_a->num,p_b->num)==0)
			{
				p_a->next=q_a->next;
				free(q_a);
				q_a=p_a->next;
				p_b=b;
			}
			else p_b=p_b->next;
  		}
  		p_a=p_a->next;
		if(p_a!=NULL) q_a=p_a->next;
		p_b=b;
	}
}
