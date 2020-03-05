#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#define MAXLIST 100
typedef struct POLY
{
	struct POLY * next;
	int p;
	float a;
} Poly; //Σa^p

Poly * GetPoly();
int PrintPoly(Poly *head);
int AddPoly(Poly *head1,Poly *head2);
int SubPoly(Poly *head1,Poly *head2);
int CalPoly(Poly *head,float x);
void DestroyPoly(Poly *head);
void ClearPoly(Poly *head); 
int InsertTerm(Poly *head);
int DeleteTerm(Poly *head);
int EditTerm(Poly *head);
int Diff(Poly *head,int n);
int coef(int p,int n);
int Intg(Poly *head);
int IntgAB(Poly *head,float a,float b);

int main()
{
	Poly *HeadList[MAXLIST+10];
	int Poly_count=0;
	int func=-1;
	int num=0,num1=0,num2=0;
	float x=0,a,b;
	while(1){
		printf("请选择功能:\n");
		printf(" 1.创建多项式\n");
		printf(" 2.输出多项式\n");
		printf(" 3.多项式求和\n");
		printf(" 4.多项式求差\n");
		printf(" 5.多项式求值\n");
		printf(" 6.多项式销毁\n");
		printf(" 7.多项式清空\n");
		printf(" 8.多项式插入\n");
		printf(" 9.多项式删除\n");
		printf("10.多项式修改\n");
		printf("11.多项式微分\n");
		printf("12.多项式不定积分\n");
		printf("13.多项式定积分\n");
		printf(" 0.退出程序\n\n");
		
		if(scanf("%d",&func)!=1){
			printf("选择失败，请重试\n\n"); 
			while(getchar()!='\n');
			continue; 
		}
		if(!func) break;
		switch(func){
			case 1://创建 
				if(Poly_count<MAXLIST){
					printf("请输入多项式：\n") ;
					HeadList[Poly_count]=GetPoly();
					if(HeadList[Poly_count]==NULL) printf("输入失败\n\n");
					else {
						PrintPoly(HeadList[Poly_count]);
						printf("输入成功，存储为第%d个多项式\n\n",++Poly_count);
					}
				}
				else{
					printf("列表已满\n\n");
				}
				break;
			case 2://输出
				printf("请输入要输出的多项式序号(1~%d)：",Poly_count);
				if(scanf("%d",&num)!=1)
					while(getchar()!='\n');
				if(num<1 || num>Poly_count){
					printf("序号错误\n\n");
				}
				else{
					if(PrintPoly(HeadList[num-1])) 
						printf("完成\n共%d项\n\n",HeadList[num-1]->p);
				}
				num=0;
				break;
			case 3://求和
				printf("请输入两和式序号(1~%d)：",Poly_count);
				if(scanf("%d%d",&num1,&num2)!=2)
					while(getchar()!='\n');
				if(num1<1 || num1>Poly_count || num2<1 || num2>Poly_count){
					printf("序号错误\n\n");
				}
				else{
					AddPoly(HeadList[num1-1],HeadList[num2-1]);
				}
				num1=num2=0;
				break;
			case 4://求差
				printf("请输入被减式与减式序号(1~%d)：",Poly_count);
				if(scanf("%d%d",&num1,&num2)!=2)
					while(getchar()!='\n');
				if(num1<1 || num1>Poly_count || num2<1 || num2>Poly_count){
					printf("序号错误\n\n");
				}
				else{
					SubPoly(HeadList[num1-1],HeadList[num2-1]);
				}
				num1=num2=0;
				break;
			case 5://求值
				printf("请输入多项式序号(1~%d)：",Poly_count);
				if(scanf("%d",&num)!=1)
					while(getchar()!='\n');
				else if(num<1 || num>Poly_count){
					printf("序号错误\n\n");
				}
				else{
					PrintPoly(HeadList[num-1]);
					printf("请输入自变量值x的值：");
					if(scanf("%f",&x)!=1)
						while(getchar()!='\n');
					else if(CalPoly(HeadList[num-1],x)) printf("完成\n\n");
					else printf("错误\n\n");
				}
				num=0; 
				break;
			case 6://销毁 
				if(Poly_count==0){
					printf("无多项式\n\n");
					break;
				}
				printf("请输入要销毁的多项式序号(1~%d)：",Poly_count);
				if(scanf("%d",&num)!=1)
					while(getchar()!='\n');
				if(num<1 || num>Poly_count){
					printf("序号错误\n\n");
				}
				else{
					DestroyPoly(HeadList[num-1]);
					for(int i=num-1;i<Poly_count-1;i++)
						HeadList[i]=HeadList[i+1];
					HeadList[--Poly_count]=NULL;
					printf("已销毁，剩余%d个多项式\n\n",Poly_count);
				}
				num=0; 
				break;
			case 7://清空 
				printf("请输入要清空的多项式序号(1~%d)：",Poly_count);
				if(scanf("%d",&num)!=1)
					while(getchar()!='\n');
				if(num<1 || num>Poly_count){
					printf("序号错误\n\n");
				}
				else{
					ClearPoly(HeadList[num-1]);
					if(HeadList[num-1]->next == NULL && HeadList[num-1]->p == 0)
						printf("第%d个多项式已清空\n\n",num);
				}
				num=0;
				break;
			case 8://插入
				printf("请输入操作多项式序号(1~%d)：",Poly_count);
				if(scanf("%d",&num)!=1)
					while(getchar()!='\n');
				if(num<1 || num>Poly_count){
					printf("序号错误\n\n");
				}
				else{
					num1=InsertTerm(HeadList[num-1]);
					if(num1!=-1)
						printf("插入成功，新多项式含%d项\n\n",num1);
					else printf("插入失败\n\n");
				}
				num=num1=0;
				break;
			case 9://删除 
				printf("请输入操作多项式序号(1~%d)：",Poly_count);
				if(scanf("%d",&num)!=1)
					while(getchar()!='\n');
				if(num<1 || num>Poly_count){
					printf("序号错误\n\n");
				}
				else{
					num1=DeleteTerm(HeadList[num-1]);
					if(num1==-1)
						printf("删除失败\n\n");
					else
						printf("删除成功，剩余%d项\n\n",num1);
				}
				num=num1=0;
				break;
			case 10://修改 
				printf("请输入操作多项式序号(1~%d)：",Poly_count);
				if(scanf("%d",&num)!=1)
					while(getchar()!='\n');
				if(num<1 || num>Poly_count){
					printf("序号错误\n\n");
				}
				else{
					if(EditTerm(HeadList[num-1]))
						printf("已修改\n\n");
					else
						printf("修改失败\n\n");
				}
				num=0;
				break;
			case 11://微分 
				printf("请输入操作多项式序号(1~%d)及微分阶数：",Poly_count);
				if(scanf("%d%d",&num,&num2)!=2)
					while(getchar()!='\n');
				if(num<1 || num>Poly_count){
					printf("序号错误\n\n");
				}
				else if(num2<0){
					printf("无效阶数\n\n");
				}
				else{
					if(Diff(HeadList[num-1],num2))
						printf("完成\n\n");
				}
				num=num2=0;
				break;
			case 12://不定积分
				printf("请输入操作多项式序号(1~%d)：",Poly_count);
				if(scanf("%d",&num)!=1)
					while(getchar()!='\n');
				if(num<1 || num>Poly_count){
					printf("序号错误\n\n");
				}
				else{
					if(Intg(HeadList[num-1]))
						printf("完成\n\n");
				}
				num=0;
				break;
			case 13://定积分 
				printf("请输入操作多项式序号(1~%d)：",Poly_count);
				if(scanf("%d",&num)!=1)
					while(getchar()!='\n');
				if(num<1 || num>Poly_count){
					printf("序号错误\n\n");
				}
				else{
					printf("请输入积分界：");
					if(scanf("%f%f",&a,&b)!=2)
						while(getchar()!='\n');
					if(IntgAB(HeadList[num-1],a,b))
						printf("完成\n\n");
				}
				num=0;
				break;
			default: printf("选择错误\n");
		}//switch
	}//while
	return 0;
}

Poly * GetPoly()
{
	Poly *head,*pnew,*tail;
	char c='+';
	int term=0;
	head=(Poly *)malloc(sizeof(Poly));
	if(head==NULL){
		printf("内存不足\n");
		return NULL;
	}
	head->next=NULL;
	head->p=0;//head.p存储项数
	head->a=0;
	tail=head;
	
	do
	{
		pnew=(Poly *)malloc(sizeof(Poly));
		if(pnew==NULL){
			printf("内存不足，已创建前%d项\n",term);
			break;
		}
		if(scanf("%f*x^%d",&pnew->a,&pnew->p)!=2){
			printf("格式错误\n");
			DestroyPoly(head);
			while(getchar()!='\n');
			return NULL;
		}
		if(c=='-') pnew->a=-pnew->a;
		if(pnew->a!=0){
			pnew->next=NULL;
			tail->next=pnew;
			tail=pnew;
			term++;
		}
		else free(pnew);
	} while((c=getchar())!='\n');//输入多项式
	
	if(term>1)
	for(int i=0;i<term;i++)
	{
		Poly *p=head;
		Poly *q=p->next;
		Poly *r=q->next;
		while(r!=NULL)
		{
			if(q->p > r->p)
			{
				q->next=r->next;
				r->next=q;
				p->next=r;
			}
			p=p->next;
			q=p->next;
			r=q->next;
		}
	}//指数从小到大排序 
	
	if(term>1){
		Poly *p=head;
		Poly *q=p->next;
		Poly *r=q->next;
		while(r!=NULL){
			if(q->p == r->p){
				if(q->a + r->a ==0){
					p->next=r->next;
					free(q);
					free(r);
					term-=2; 
				}//系数相反
				else{
					q->a+=r->a;
					q->next=r->next; 
					free(r);
					term--;
				}//系数和不为零
			}//若指数相等
			else p=p->next;
			q=p->next;
			r=q->next;
		}//q、r皆有效时
	}//合并同类项
	
	head->p=term;
	return head;
}

int PrintPoly(Poly *head)
{
	Poly *p=head->next;
	if(p!=NULL){
		printf("%.3f*x^%d",p->a,p->p);
		p=p->next;
	}
	else{
		printf("0\n");
		return 1;
	}
	while(p!=NULL){
		printf("%+.3f*x^%d",p->a,p->p);
		p=p->next;
	}
	printf("\n");
	return 1;
}//输出多项式 

int AddPoly(Poly *head1,Poly *head2)
{
	Poly *p=head1->next,*q=head2->next;
	
	PrintPoly(head1);
	PrintPoly(head2);
	putchar('\n');
	 
	while(p!=NULL && q!=NULL && p->p == q->p && p->a + q->a == 0){
		p=p->next;
		q=q->next;
	}//寻找第一个可操作项 
	if(p==NULL){
		Poly *temp=head2;
		while(temp->next!=q) temp=temp->next;
		PrintPoly(temp);
		return 1;
	}//p为NULL，直接输出q 
	else if(q==NULL){
		Poly *temp=head1;
		while(temp->next!=p) temp=temp->next;
		PrintPoly(temp);
		return 1;
	}//q为NULL，直接输出p 
	else{
		if(p->p < q->p){
			printf("%.3f*x^%d",p->a,p->p);
			p=p->next;
		}
		else if(p->p > q->p){
			printf("%.3f*x^%d",q->a,q->p);
			q=q->next;
		}
		else{
			printf("%.3f*x^%d",p->a+q->a,p->p);
			p=p->next;
			q=q->next;
		}
	}//首项不需要输出正号 
	
	while(p!=NULL&&q!=NULL){
		if(p->p < q->p){
			printf("%+.3f*x^%d",p->a,p->p);
			p=p->next;
		}//p指数小
		else if(p->p > q->p){
			printf("%+.3f*x^%d",q->a,q->p);
			q=q->next;
		}//q指数小 
		else{
			if(p->a + q->a){
				printf("%+.3f*x^%d",p->a+q->a,p->p);
			}//系数和不为零 
			p=p->next;
			q=q->next;
		}//pq指数相等 
	}
	
	while(p!=NULL){
		printf("%+.3f*x^%d",p->a,p->p);
		p=p->next;
	}
	while(q!=NULL){
		printf("%+.3f*x^%d",q->a,q->p);
		q=q->next;
	}
	printf("\n");
	printf("完成\n\n");
	return 1;
}

int SubPoly(Poly *head1,Poly *head2)
{
	Poly *head2Minus,*tail,*pnew;
	
	PrintPoly(head1);
	PrintPoly(head2);
	putchar('\n');
	
	head2Minus=(Poly *)malloc(sizeof(Poly));
	if(head2Minus==NULL){
		printf("内存不足\n\n");
		return 0;
	}
	head2Minus->next=NULL;
	head2Minus->p=head2->p;
	head2Minus->a=0;
	tail=head2Minus;
	Poly *p=head2->next;
	while(p!=NULL){
		pnew=(Poly *)malloc(sizeof(Poly));
		if(pnew==NULL){
			printf("内存不足\n\n");
			return 0;
		}
		pnew->a=-p->a;
		pnew->p=p->p;
		pnew->next=NULL;
		tail->next=pnew;
		tail=pnew;
		p=p->next;
	}//创建负多项式 
	
	AddPoly(head1,head2Minus);
	DestroyPoly(head2Minus);//释放内存 
	return 1;
}

int CalPoly(Poly *head,float x)
{
	Poly *p=head->next;
	float Ans=0;
	printf("x=%.3f\n",x);
	while(p!=NULL){
		if(p->p<0 && x==0) return 0;
		Ans+=p->a*pow(x,p->p);
		p=p->next;
	}
	printf("表达式的值为%f\n",Ans);
	return 1;
}

void DestroyPoly(Poly *head)
{
	Poly *p=head->next;
	while(p!=NULL){
		head->next=p->next;
		free(p);
		p=head->next;
	}
	free(head);
}

void ClearPoly(Poly *head)
{
	Poly *p=head->next;
	while(p!=NULL){
		head->next=p->next;
		free(p);
		p=head->next;
	}
	head->p=0;//项数置零 
}

int InsertTerm(Poly *head)
{
	Poly *p=head;
	Poly *q=p->next;
	float aIN;
	int pIN;
	printf("请输入插入节点系数及指数：");
	if(scanf("%f%d",&aIN,&pIN)!=2){
		printf("格式错误\n");
		while(getchar()!='\n');
		return -1;
	}
	if(aIN==0)
		return head->p;//剔除无效输入 
	
	while(q->p < pIN){
		p=p->next;
		q=p->next;
	}//寻找插入点 
	
	if(q->p > pIN){
		Poly *pnew=(Poly *)malloc(sizeof(Poly));
		if(pnew==NULL){
			printf("内存不足\n");
			return -1;
		}
		pnew->a=aIN;
		pnew->p=pIN;
		pnew->next=q;
		p->next=pnew;
		head->p++;
	}//无相同指数项
	else{
		if(aIN + q->a != 0)
			q->a+=aIN;
		else{
			p->next=q->next;
			free(q);
			head->p--;
		}//系数相消 
	} 
	return head->p;
}

int DeleteTerm(Poly *head)
{
	Poly *p=head;
	Poly *q=p->next;
	int pDEL;
	PrintPoly(head);
	printf("请输入删除节点指数：");
	if(scanf("%d",&pDEL)!=1){
		printf("格式错误\n");
		while(getchar()!='\n');
		return -1;
	}
	while(q!=NULL && q->p!=pDEL){
		p=p->next;
		q=p->next;
	}
	if(q==NULL){
		printf("无对应项\n");
		return -1;
	}
	p->next=q->next;
	free(q);
	head->p--;
	return head->p;
}

int EditTerm(Poly *head)
{
	float aE;
	int pE;
	Poly *p=head,*q=head->next;
	
	PrintPoly(head);
	
	printf("请输入要修改的项的指数：");
	if(scanf("%d",&pE)!=1)
		while(getchar()!='\n');
	while(q!=NULL){
		if (q->p==pE)
			break;
		p=p->next;
		q=p->next;
	}//寻找修改项 
	if(q==NULL){
		printf("无对应项\n");
		return 0;
	}
	
	printf("请输入修改后节点系数及指数：");
	if(scanf("%f%d",&aE,&pE)!=2 || getchar()!='\n'){
		printf("输入错误\n");
		while(getchar()!='\n');
		return 0; 
	}
	if(aE==0){
		p->next=q->next;
		free(q);
		head->p--;
		return 1;
	}//aE=0等效于删除节点
	if(q->p==pE){
		q->a=aE;
		return 1;
	}//指数相等可简单替换 
	
	q->a=aE;
	q->p=pE;
	p->next=q->next;
	Poly *R=head,*S=head->next;
	while(S!=NULL && S->p < pE){
		R=R->next;
		S=R->next;
	}
	if(S==NULL){
		R->next=q;
		q->next=NULL;
		return 1;
	}//新项指数最大 
	if(S->p > pE){
		R->next=q;
		q->next=S;
		return 1;
	}//无相同指数项直接插入 
	
	if(S->a + aE ==0){
		R->next=S->next;
		free(S);
		free(q);
		head->p-=2;
		return 1;
	}
	S->a += q->a;
	free(q);
	head->p--;
	return 1;
}

int Diff(Poly *head,int n)
{
	Poly *p=head->next;
	int flag=0;//标记有效输出
	float aOUT;
	int pOUT; 
	while(p!=NULL){
		if(p->p > 0 && p->p < n);//微分后为0
		else{
			aOUT=p->a*coef(p->p,n);
			pOUT=p->p-n;
			if(aOUT!=0 && flag==0){
				printf("%.3f*x^%d",aOUT,pOUT);
				flag++;
			}
			else if(aOUT!=0)
				printf("%+.3f*x^%d",aOUT,pOUT);
		}
		p=p->next;
	}
	if(flag==0) printf("0");
	printf("\n");
	return 1;
}

int coef(int p,int n)
{
	if(n==0) return 1;
	else return p*coef(p-1,n-1);
}

int Intg(Poly *head)
{
	Poly *p=head->next;
	int flag=0;//标记有效输出
	while(p!=NULL){
		if(p->p==-1){
			if(flag==0){
				printf("%.3f*ln(x)",p->a);
				flag++;
			}
			else
				printf("%+.3f*ln(x)",p->a);
		}//p=-1积分为对数
		else{
			if(flag==0){
				printf("%.3f*x^%d",p->a/(p->p+1),p->p+1);
				flag++;
			}
			else
				printf("%+.3f*x^%d",p->a/(p->p+1),p->p+1);
		}
		p=p->next;
	}
	
	if(flag!=0)
		putchar('+');
	printf("C\n");
	return 1;
}

int IntgAB(Poly *head,float a,float b)
{
	Poly *p=head->next;
	float Ans=0;
	while(p!=NULL){
		if(p->p == -1){
			if(a<=0 || b<=0){
				printf("积分界错误\n\n");
				return 0;
			}
			Ans+=log(b/a);
		}//对数 
		else if(p->p >= 0){
			Ans+=(p->a/(p->p+1))*(pow(b,p->p+1)-pow(a,p->p+1));
		}//正指数 
		else{
			if(a*b<=0){
				printf("积分界错误\n\n");
				return 0;
			}
			Ans+=(p->a/(p->p+1))*(pow(b,p->p+1)-pow(a,p->p+1));
		}//负指数 
		p=p->next;
	}
	printf("%.3f\n",Ans); 
	return 1;
}

