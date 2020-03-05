#include <stdio.h>
#include <stdlib.h>
typedef struct
{
	int yyyy;
	int mm;
	int dd;
} DATE;
int days(int yyyy,int mm,int dd);

int main()
{
	DATE date;
	int day;
	printf("Input year,mounth,day:(yyyy.mm.dd)\n");
	scanf("%d.%d.%d",&date.yyyy,&date.mm,&date.dd);
	day=days(date.yyyy,date.mm,date.dd);
	printf("%d.%d.%d is the %dth day of the year.",date.yyyy,date.mm,date.dd,day);
	return 0;
}

int days(int yyyy,int mm,int dd)
{
	int month[12]={31,28,31,30,31,30,31,31,30,31,30,31};
	int i,day=0;
	if((yyyy%400==0)||(yyyy%4==0&&yyyy%100!=0)) month[1]++;//判断闰年
	if((yyyy<1)||(mm<1)||(mm>12)||(dd<1)||(dd>month[mm-1]))
	{
		printf("illegal input!\n");
		exit(0);
	}//判断日期有效
	for(i=0;i<mm-1;i++) day+=month[i];
	day+=dd;
	return (day);
}
