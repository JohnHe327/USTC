#include <stdio.h>
#include <stdlib.h>
typedef struct POLY
{
	struct POLY * next;
	int p;
	int a;
} Poly;

Poly * Getpoly();

int main()
{
	Poly *p1=Getpoly();
	Poly *p2=Getpoly();
	Poly *ans,*p=p1->next,*q=p2->next;
	ans=(Poly *)malloc(sizeof(Poly));
	Poly *add=ans;
	while(p!=NULL&&q!=NULL)
	{
		if(p->p<q->p)
		{
			add->next=p;
			add=p;
			p=p->next;
		}
		else if(p->p>q->p)
		{
			add->next=q;
			add=q;
			q=q->next;
		}
		else
		{
			if(p->a+q->a)
			{
				p->a+=q->a;
				q=q->next;
				add->next=p;
				add=p;
				p=p->next;
			}
			else
			{
				p=p->next;
				q=q->next;
			}
		}
	}
	
	if(q==NULL) add->next=p;
	if(p==NULL) add->next=q;
	if((add=ans->next)!=NULL)
	{
		printf("%d*x^%d",add->a,add->p);
		add=add->next;
	}
	while(add!=NULL)
	{
		printf("%+d*x^%d",add->a,add->p);
		add=add->next;
	}
	return 0;
}

Poly * Getpoly()
{
	Poly *head,*pnew,*tail;
	char c;
	int term=0;
	head=(Poly *)malloc(sizeof(Poly));
	head->next=NULL;
	head->p=-1;
	head->a=0;
	tail=head;
	
	do
	{
		pnew=(Poly *)malloc(sizeof(Poly));
		scanf("%d*x^%d",&pnew->a,&pnew->p);
		if(c=='-') pnew->a=-pnew->a;
		pnew->next=NULL;
		tail->next=pnew;
		tail=pnew;
		term++;
	} while((c=getchar())!='\n');
	
	if(term>1)
	for(int i=0;i<term;i++)
	{
		Poly *p,*q,*r;
		p=head;
		q=p->next;
		r=q->next;
		while(r!=NULL)
		{
			if(q->p>r->p)
			{
				q->next=r->next;
				r->next=q;
				p->next=r;
				Poly *temp=r;
				r=q;
				q=temp;
			}
			p=p->next;
			q=q->next;
			r=r->next;
		}
	}
	return head;
}
