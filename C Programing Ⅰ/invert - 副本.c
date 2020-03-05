#include <stdio.h>
#include <string.h>
void invert(char *p_str,int len);
int main()
{
	char str[50];
	gets(str);
	invert(str,strlen(str));
	puts(str);
}

void invert(char *p_str,int len)
{
	int i;
	char temp;
	for(i=0;i<len/2;i++)
	{
		temp=*(p_str+i);
		*(p_str+i)=*(p_str+len-i-1);
		*(p_str+len-i-1)=temp;
	}
}
