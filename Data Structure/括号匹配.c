#include <stdio.h>
#include <stdlib.h>
#define StackSize 10000
typedef struct{
	char data[StackSize+10];
	int top;
}Stack;
int Judge(char *str);
void InitStack(Stack *S);
int IsEmpty(Stack *S);
int Push(Stack *S,char c);
int GetTop(Stack *S,char *c);
int Pop(Stack *S,char*c);

int main()
{
	int N;
	char str[100000];
	
	scanf("%d",&N);
	
	while(N--)
	{
		scanf("%s",str);
		
		if(Judge(str))
			printf("YES\n");
		else printf("NO\n");
	}
	
	return 0;
}

int Judge(char *str)
{
	Stack S;
	char c;
	InitStack(&S);
	for(int i=0;str[i]!='@';i++){
		switch (str[i]){
			case '(':
			case '[':
			case '{':
				Push(&S,str[i]);
				break;
			case ')':
				GetTop(&S,&c);
				if(c=='(') Pop(&S,&c);
				else return 0;
				break;
			case ']':
				GetTop(&S,&c);
				if(c=='[') Pop(&S,&c);
				else return 0;
				break;
			case '}':
				GetTop(&S,&c);
				if(c=='{') Pop(&S,&c);
				else return 0;
				break;
		}
	}
	return (IsEmpty(&S));
}

void InitStack(Stack *S)
{
	S->top=-1;
}

int IsEmpty(Stack *S)
{
	if(S->top==-1) return 1;
	else return 0;
}

int Push(Stack *S,char c)
{
	if(S->top==StackSize-1) return 0;
	++S->top;
	S->data[S->top]=c;
	return 1;
}

int GetTop(Stack *S,char *c)
{
	if(IsEmpty(S)) return 0;
	*c=S->data[S->top];
	return 1;
}

int Pop(Stack *S,char*c)
{
	if(IsEmpty(S)) return 0;
	*c=S->data[S->top];
	--S->top;
	return 1;
}
