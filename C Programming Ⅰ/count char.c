#include <stdio.h>
int main()
{
	char ch;
	int a[4]={0};
	//a[0]=character
	//a[1]=space
	//a[2]=number
	//a[3]=other
	while ((ch=getchar())!='\n')
	{
		if ((ch>=65&&ch<=90)||(ch>=97&&ch<=122)) a[0]++;
		else if (ch==32) a[1]++;
		else if (ch>=48&&ch<=57) a[2]++;
		else a[3]++;
	}
	printf("character(%d)\n",a[0]);
	printf("space(%d)\n",a[1]);
	printf("number(%d)\n",a[2]);
	printf("other(%d)\n",a[3]);
	return 0;
}
