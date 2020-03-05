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
	for(i=0;i<=strlen(s2);i++)
	s1[i]=s2[i];
	printf(" String 1: %s\n\n",s1);
}
}
