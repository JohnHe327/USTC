//open 01 02 03 04 05
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define NAME 20
#define NUMBER 20
#define EMAIL 50
#define ADDRESS 100
#define BIRTHDAY 15
typedef struct ACCOUNT
{
	struct ACCOUNT *next;
	char name[NAME];
	char number[NUMBER];
	char email[EMAIL];
	char address[ADDRESS];
	char birthday[BIRTHDAY];
}Account;

Account *CreatLinkList();
void DeleteLinkList(Account *head);
void Add();
void Find();
void Edit();
void Delete();
void ViewAll();
void Sort();

int main()
{
	printf("Welcome!\n");
	printf("\n通讯录使用说明:\n");
	printf("1.新建联系人无内容时请用'#'代替；\n");
	printf("2.可查找任意项；\n");
	printf("3.查看信息不完整条目请搜索'#'；\n");
	printf("4.通讯录自动按姓名排序；\n\n");

start:
	printf("Choose function:\n");
	printf("1.Add\n2.Find\n3.Edit\n4.Delete\n5.View all\n0.exit\n\n");

	switch(getchar())
	{
		case '1':
			getchar();
			Add();
			Sort();
			break;
		case '2':
			getchar();
			Find();
			break;
		case '3':
			getchar();
			Edit();
			break;
		case '4':
			getchar();
			Delete();
			break;
		case '5':
			getchar();
			ViewAll();
			break;
		case '0':
			printf("Goodbye!");
			getchar();
			getchar();
			return 0;
		default:
			printf("Error!Please choose again.\n\n");
			getchar();
			goto start;
	}
	printf("Press Enter to continue...\n\n\n");
	getchar();
	goto start;
}

void Add()
{
	FILE *fp;
	Account *pnew;
	
	if((fp=fopen("Contacts.txt","a"))==NULL)
	{
		printf("Cannot open.01\n");
		return;
	}

	pnew=(Account *)malloc(sizeof(Account));
	if(pnew==NULL)
	{
		printf("No enough memory!\n");
		return;
	}
	
	printf("Please enter:\nName:");		scanf("%19s",pnew->name);
	printf("Phone Number:");	scanf("%19s",pnew->number);
	printf("email:");           scanf("%49s",pnew->email);
	printf("Address:");			scanf("%99s",pnew->address);
	printf("Birthday:");		scanf("%14s",pnew->birthday);
	getchar();
	
	printf("\n");
	if(strcmp(pnew->name,"#")) printf("%s ",pnew->name);
	if(strcmp(pnew->number,"#")) printf("%s ",pnew->number);
	if(strcmp(pnew->email,"#")) printf("%s ",pnew->email);
	if(strcmp(pnew->address,"#")) printf("%s ",pnew->address);
	if(strcmp(pnew->birthday,"#")) printf("%s ",pnew->birthday);
	printf("Added\n\n");
	fprintf(fp,"%s %s %s %s %s\n",pnew->name,pnew->number,pnew->email,pnew->address,pnew->birthday);
	
	free(pnew);
	fclose(fp);
}

void Find()
{
	Account *head,*p;
	char temp[100];
	int flag=1;
	head=CreatLinkList();
	if(head==NULL) return;
	printf("Please enter the revevant contents:");
	scanf("%s",temp);
	getchar();
	p=head->next;
	
	while(p!=NULL)
	{
		if((!strcmp(temp,p->name))||(!strcmp(temp,p->number))||(!strcmp(temp,p->email))||(!strcmp(temp,p->address))||(!strcmp(temp,p->birthday)))
		{
			printf("\n");
			if(strcmp(p->name,"#")) printf("%s ",p->name);
			if(strcmp(p->number,"#")) printf("%s ",p->number);
			if(strcmp(p->email,"#")) printf("%s ",p->email);
			if(strcmp(p->address,"#")) printf("%s ",p->address);
			if(strcmp(p->birthday,"#")) printf("%s ",p->birthday);
			printf("\n\n");
			flag=0;
		}
		p=p->next;
	}
	if(flag) printf("\nNot found!\n\n");
	DeleteLinkList(head);
}

void Edit()
{
	Account *head,*p;
	char temp[100],temp0[100];
	int flag=1;
	FILE *out;
	char ch;
	head=CreatLinkList();
	if(head==NULL) return;
	p=head->next;
	
	printf("Please enter the contents to be changed:");
	scanf("%s",temp);
	getchar();
	
	while(p!=NULL)
	{
		if((!strcmp(temp,p->name))||(!strcmp(temp,p->number))||(!strcmp(temp,p->email))||(!strcmp(temp,p->address))||(!strcmp(temp,p->birthday)))
		{
			printf("\nEdit ");
			if(!(strcmp(p->name,temp))) printf("/ %s / ",p->name);
			else if(!(strcmp(p->number,temp))) printf("/ %s / ",p->number);
			else if(!(strcmp(p->email,temp))) printf("/ %s / ",p->email);
			else if(!(strcmp(p->address,temp))) printf("/ %s / ",p->address);
			else printf("/ %s / ",p->birthday);
			printf("in account // %s,%s,%s,%s,%s //?\n[Y]es     [N]o\n",p->name,p->number,p->email,p->address,p->birthday);
			
			ch=getchar();
			if(ch=='y'||ch=='Y')
			{
				getchar();
				flag=0;
				printf("\nPlease enter new contents:");
				scanf("%s",temp0);
				getchar();
				if(!(strcmp(p->name,temp)))
				{
					while(strlen(temp0)>=NAME)
					{
						printf("Too long! Please type again (less than %d charactors):\n",NAME);
						scanf("%s",temp0);
						getchar();
					}
					strcpy(p->name,temp0);
				}
				else if(!(strcmp(p->number,temp)))
				{
					while(strlen(temp0)>=NUMBER)
					{
						printf("Too long! Please type again (less than %d charactors):\n",NUMBER);
						scanf("%s",temp0);
						getchar();
					}
					strcpy(p->number,temp0);
				}
				else if(!(strcmp(p->email,temp)))
				{
					while(strlen(temp0)>=EMAIL)
					{
						printf("Too long! Please type again (less than %d charactors):\n",EMAIL);
						scanf("%s",temp0);
						getchar();
					}
					strcpy(p->email,temp0);
				}
				else if(!(strcmp(p->address,temp)))
				{
					while(strlen(temp0)>=ADDRESS)
					{
						printf("Too long! Please type again (less than %d charactors):\n",ADDRESS);
						scanf("%s",temp0);
						getchar();
					}
					strcpy(p->address,temp0);
				}
				else
				{
					while(strlen(temp0)>=BIRTHDAY)
					{
						printf("Too long! Please type again (less than %d charactors):\n",BIRTHDAY);
						scanf("%s",temp0);
						getchar();
					}
					strcpy(p->birthday,temp0);
				}
				
				printf("\nUploading: %s %s %s %s %s...\n",p->name,p->number,p->email,p->address,p->birthday);
				break;
			}
			else getchar();
		}
		p=p->next;
	}
	
	if(flag)
	{
		printf("\nNot found!\n\n");
		DeleteLinkList(head);
		return;
	}
	
	if((out=fopen("Contacts.txt","w"))==NULL)
	{
		printf("Cannot open.04\n");
		DeleteLinkList(head);
		return;
	}
	
	for(p=head->next;p!=NULL;p=p->next)
	fprintf(out,"%s %s %s %s %s\n",p->name,p->number,p->email,p->address,p->birthday);
	printf("Uploaded!\n\n");
	Sort();
	
	fclose(out);
	DeleteLinkList(head);
}

void Delete()
{
	Account *head,*p,*q;
	FILE *out;
	char temp[100];
	int flag=1;
	head=CreatLinkList();
	if(head==NULL) return;
	p=head;
	q=p->next;
	
	if((out=fopen("Contacts.txt","w"))==NULL)
	{
		printf("Cannot open.05\n");
		DeleteLinkList(head);
		return;
	}
	
	printf("Please enter the name to be deleted:");
	scanf("%s",temp);
	getchar();
	
	while(q!=NULL)
	{
		if(!(strcmp(q->name,temp)))
		{
			p->next=q->next;
			free(q);
			flag=0;
			break;
		}
		else
		{
			p=p->next;
			q=p->next;
		}
	}
	
	if(flag) printf("Not found!\n");
	else
	{
		for(p=head->next;p!=NULL;p=p->next)
		fprintf(out,"%s %s %s %s %s\n",p->name,p->number,p->email,p->address,p->birthday);
		printf("Deleted!\n\n");
	}
	
	fclose(out);
	DeleteLinkList(head);
}

void ViewAll()
{
	Account *head,*p;
	head=CreatLinkList();
	if(head==NULL) return;
	p=head->next;
	while(p!=NULL)
	{
		if(strcmp(p->name,"#")) printf("%s ",p->name);
		if(strcmp(p->number,"#")) printf("%s ",p->number);
		if(strcmp(p->email,"#")) printf("%s ",p->email);
		if(strcmp(p->address,"#")) printf("%s ",p->address);
		if(strcmp(p->birthday,"#")) printf("%s ",p->birthday);
		printf("\n");
		p=p->next;
	}
	printf("\n");
	free(p);
	DeleteLinkList(head);
}

void Sort()
{
	Account *head;
	Account *p,*q,*r;
	int i,j=0;
	FILE *out;
	
	head=CreatLinkList();
	if(head==NULL) return;
	p=head;
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
		while(r!=NULL)
		{
			if(strcmp(q->name,r->name)>0)
			{
				q->next=r->next;
				p->next=r;
				r->next=q;
			}
			p=p->next;
			q=p->next;
			r=q->next;
		}
	}

	if((out=fopen("Contacts.txt","w"))==NULL)
	{
		printf("Cannot open.02\n");
		DeleteLinkList(head);
		return;
	}
	
	for(p=head->next;p!=NULL;p=p->next)
	fprintf(out,"%s %s %s %s %s\n",p->name,p->number,p->email,p->address,p->birthday);
	DeleteLinkList(head);
	fclose(out);
}

Account *CreatLinkList()
{
	Account *head,*pnew,*tail;
	FILE *in;
	
	head=(Account *)malloc(sizeof(Account));
	if(head==NULL)
	{
		printf("No enough memory!");
		return(NULL);
	}
	head->next=NULL;
	tail=head;
	
	if((in=fopen("Contacts.txt","r"))==NULL)
	{
		printf("Cannot open.03\n");
		DeleteLinkList(head);
		return(NULL);
	}
	
	while(1)
	{
		pnew=(Account *)malloc(sizeof(Account));
		if(pnew==NULL)
		{
			printf("No enough memory!");
			DeleteLinkList(head);
			return(NULL);
		}
		
		fscanf(in,"%s%s%s%s%s",pnew->name,pnew->number,pnew->email,pnew->address,pnew->birthday);
		if(!feof(in))
		{
			tail->next=pnew;
			pnew->next=NULL;
			tail=pnew;
		}
		else
		{
			free(pnew);
			break;
		}
	}
	fclose(in);
	return(head);
}

void DeleteLinkList(Account *head)
{
	Account *p,*q;
	while(head->next!=NULL)
	{
		p=head;
		q=p->next;
		while(q->next!=NULL)
		{
			p=p->next;
			q=p->next;
		}
		free(q);
		p->next=NULL;
	}
	free(head);
}

