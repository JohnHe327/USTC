#include <stdio.h>
#include <string.h>
void catenate(int len,char *p_a,char *p_b);
int main()
{
	char a[50],b[25]; 
	printf("Input array a,b\n");
	gets(a);	gets(b);
	catenate(strlen(a),a,b);	
	puts(a);
	return 0;
}

void catenate(int len,char *p_a,char *p_b)
{
	int i;
	for(i=0;i<25;i++)
	*(p_a+len+i)=*(p_b+i);
}
