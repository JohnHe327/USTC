//bailian.openjudge.cn/practice/2952
#include <stdio.h>
int IsCyclic(const int num[],const int len,const int times);
int main()
{
	int num[60],len,flag = 1;
	char temp;
	int i;
	
	for(i = 0; i < 60; i++)
	if((temp = getchar()) != '\n')
 		num[i] = temp - '0';
	else break;
	len = i;
	
	for(i = 1; i <= len; i++)
	{
		flag = IsCyclic(num,len,i);
		if(flag == 0)
		break;
	}
	
	printf("%d",flag);
	return 0;
}

int IsCyclic(const int num[],const int len,const int times)
{
	int result[60];
	int i , flag , temp , move;
	for(i = 0; i < len; i++)
		result[i] = num[i] * times;
	for(i = len-1; i > 0; i--)
	{
		result[i-1] += result[i] / 10;
		result[i] %= 10;
	}
	
	for(move = 0; move < len; move++)
	{
		temp = result[0];
		for(i = 0; i < len-1; i++)
		result[i] = result[i+1];
		result[i] = temp;
		flag = 1;
		
		for(i = 0; i < len; i++)
		if(result[i] != num[i])
		{
			flag = 0;
			break;
		}
		
		if(flag == 1)
			return flag;
	}
	return flag;
}
