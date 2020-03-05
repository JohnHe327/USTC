#include <stdio.h>
#include <stdlib.h>
typedef struct cust{
	int count;
	int arrtime;
	int lefttime;
	int money;
	struct cust* next;
}Cust;
int N,total,closetime,avertime,time=0;
int Done[1000];

void Put(Cust *p);
int Check(Cust *Q);
void Get(Cust *p);
void Insert(Cust *Q,Cust *p);
int main()
{
	//freopen("in5out.txt.","w",stdout);
	Cust *head,*tail;
	Cust *Queue;
	int i=0;
	
	Queue=(Cust *)malloc(sizeof(Cust));
	Queue->next=NULL;
	
	scanf("%d%d%d%d",&N,&total,&closetime,&avertime);
	head=(Cust *)malloc(sizeof(Cust));
	tail=head;
	tail->next=NULL;
	
	while(N--){
		Cust *pnew;
		pnew=(Cust *)malloc(sizeof(Cust));
		pnew->count=i++;
		scanf("%d%d",&pnew->money,&pnew->arrtime);
		pnew->lefttime=closetime;
		pnew->next=NULL;
		tail->next=pnew;
		tail=pnew;
		Done[pnew->count]=pnew->lefttime-pnew->arrtime;
	}
	N=i;
	
	Cust *p=head->next;
	while(time<closetime&&head->next!=NULL){
		p=head->next;
		if(time<p->arrtime) time=p->arrtime;
		if(p->money>0){
			Put(p);
			head->next=p->next;
			free(p);
			while(Queue->next&&Check(Queue));
		}
		else if(p->money<=0){
			if(p->money+total>=0){
				Get(p);
				head->next=p->next;
				free(p);
			}
			else{
				Cust *pnew;
				pnew=(Cust *)malloc(sizeof(Cust));
				*pnew=*p;
				Insert(Queue,pnew);
				head->next=p->next;
				free(p);
			}
		}
	}
	
	while(time<closetime){
		int flag=0;
		while(Queue->next&&Check(Queue)) flag=1;
		if(flag==0) break;
	}
	
	int TOTALTIME=0;
	for(i=0;i<N;i++){
		printf("%d\n",Done[i]);
		TOTALTIME+=Done[i];
	}
	printf("%d",TOTALTIME/N);
	return 0;
}

void Put(Cust *p)
{
	if(time<=closetime){
		total+=p->money;
		time+=avertime;
		p->lefttime=time-avertime;
		Done[p->count]=p->lefttime-p->arrtime;
	}
}

int Check(Cust *Q)
{
	Cust *p=Q->next;
	do{
		if(p->money+total>=0){
			Get(p);
			Cust *q=p;
			while(q->next!=p) q=q->next;
			if(p!=q){
				q->next=p->next;
				free(p);
				Q->next=q->next;
			}
			else{
				free(p);
				Q->next=NULL;
			}
			return 1;
		}
		p=p->next;
	}while(p!=Q->next);
	return 0;
}

void Get(Cust *p)
{
	if(time<=closetime){
		total+=p->money;
		time+=avertime;
		p->lefttime=time-avertime;
		Done[p->count]=p->lefttime-p->arrtime;
	}
}

void Insert(Cust *Q,Cust *p)
{
	if(Q->next!=NULL){
		Cust *q=Q->next;
		while(q->next!=Q->next) q=q->next;
		q->next=p;
		p->next=Q->next;
	}
	else{
		Q->next=p;
		p->next=p;
	}
}

