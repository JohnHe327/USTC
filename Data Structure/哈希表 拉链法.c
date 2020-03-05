#include <stdio.h>
#include <stdlib.h>
#define MAXSIZE 100
typedef struct HNODE{
	int ele;
	int Scnt;
	struct HNODE *next;
}HNode;

int main()
{
	HNode HTable[MAXSIZE];
	int input[MAXSIZE];
	int total,p;
	float scnt=0,uscnt=0;
	
	scanf("%d",&total);
	for(int i=0;i<total;i++){
		scanf("%d",&input[i]);
	}
	
	scanf("%d",&p);
	
	//Creathash
	//initial
	for(int i=0;i<p;i++){
		HTable[i].ele=-1;
		HTable[i].Scnt=1;
		HTable[i].next=NULL;
	}
	
	for(int i=0;i<total;i++){
		int fkey=input[i]%p;
		HNode* pointer=&HTable[fkey];
		int success=1;
		
		while(pointer->next!=NULL){
			pointer=pointer->next;
			success++;
		}
		HNode* pnew=(HNode *)malloc(sizeof(HNode));
		pnew->ele=input[i];
		pnew->Scnt=success;
		pnew->next=NULL;
		pointer->next=pnew;
		HTable[fkey].Scnt=success+1;
	}
	
	//print hashtable
	for(int i=0;i<p;i++){
		printf("\n\n哈希表的地址：\t%d",i);
		printf("\n表中的关键字：\t");
		if(HTable[i].next==NULL) printf("-");
		else{
			HNode* pointer=HTable[i].next;
			while(pointer!=NULL){
				printf("%d\t",pointer->ele);
				pointer=pointer->next;
			}
		}
		printf("\n成功查找次数：\t");
		if(HTable[i].next==NULL) printf("0");
		else{
			HNode* pointer=HTable[i].next;
			while(pointer!=NULL){
				printf("%d\t",pointer->Scnt);
				scnt+=pointer->Scnt;
				pointer=pointer->next;
			}
		}
		printf("\n失败查找次数：\t%d",HTable[i].Scnt);
		uscnt+=HTable[i].Scnt;
	}
	
	printf("\n平均成功查找长度：%f",scnt/total);
	printf("\n平均失败查找长度：%f",uscnt/p);
	
	//search 
	printf("\n\n输入查找key：");
	int key;
	scanf("%d",&key);
	int fkey=key%p;
	HNode* pointer=HTable[fkey].next;
	if(pointer==NULL) printf("\n查找失败，比较次数：1");
	else{
		while(pointer!=NULL && pointer->ele!=key)
		pointer=pointer->next;
	}
	if(pointer==NULL) printf("\n查找失败，比较次数：%d",HTable[fkey].Scnt);
	else printf("\n表内编号：%d\n比较次数：%d",fkey,pointer->Scnt);
	return 0;
}

