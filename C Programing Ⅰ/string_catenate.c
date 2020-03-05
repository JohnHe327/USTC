#include <stdio.h>
#include <string.h>
int main()
{
for(;;){
	char s1[100],s2[50];
	int i=0,j=0;
	printf("Input string 1: ");
	gets(s1);
	printf("Input string 2: ");
	gets(s2);
	i=strlen(s1);
	
	for(j=0;j<50;j++)
	s1[i+j]=s2[j];
	
	puts(s1);
}
}
