#include <stdio.h>
#include <string.h>
void count(char *p_str,int *p_len);
int cmp(int *p_len);
int main()
{
	char str[50];
	int len[50]={0};
	int mark1=0,mark2=0;
	int i;
	gets(str);
	count(str,len);
	for(i=0;i<cmp(len);i++)
	mark1+=len[i]+1;
	mark2=mark1+len[i];

	for(i=mark1;i<mark2;i++)
	printf("%c",str[i]);
	return 0;
}

void count(char *p_str,int *p_len)
{
	int i;
	for(i=0;i<50;i++)
	{
		if((*(p_str+i)!=' ')&&(*(p_str+i)!='\0')) (*p_len)++;
		else if(*(p_str+i)==' ') p_len++;
		else break;
	}
}

int cmp(int *p_len)
{
	int i,j;
	for(i=0,j=1;j<50;j++)
	if(*(p_len+i)<*(p_len+j)) i=j;
	return(i);
}
