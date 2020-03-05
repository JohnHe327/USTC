#include <stdio.h>
int main()
{
	int score;
	char level;
	printf("The score is");
	scanf("%d",&score);
	if (score>=0&&score<60)
		level='E';
	else if (score>=60&&score<70)
	    level='D';
	else if (score>=70&&score<80)
	    level='C';
	else if (score>= 80&&score<90)
	    level='B';
	else if (score>=90&&score<=100)
	    level='A';
	else printf("error");
	if (score>=0&&score<=100)
	printf("%c",level);
	return 0;
}
