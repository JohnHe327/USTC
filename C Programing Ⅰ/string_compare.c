#include <stdio.h>
#include <string.h>
int main()
{
for(;;){
	char s1[50],s2[50];
	int i=0;
	printf(" Input string 1: ");
	gets(s1);
	printf(" Input string 2: ");
	gets(s2);
	if(strcmp(s1,s2)==0) printf(" 0\n\n");
	else
	for(i=0;i<50;i++)
	if(s1[i]!=s2[i])
	{
		printf(" %d\n\n",s1[i]-s2[i]);
		break;
	}
}
}
