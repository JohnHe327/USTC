//bailian.openjudge.cn/practice/2814
#include <stdio.h>
int main()
{
	int clock[10] = {0};
	int move[10] = {0}, answer[10] = {0};
	int i;

	for(int i = 1; i < 10; i++)
	{
		scanf("%d",&clock[i]);
		clock[i] %= 4;
	}
	
	for(move[1] = 0; move[1] < 4; move[1]++)
	for(move[2] = 0; move[2] < 4; move[2]++)
	for(move[3] = 0; move[3] < 4; move[3]++)
	for(move[4] = 0; move[4] < 4; move[4]++)
	for(move[5] = 0; move[5] < 4; move[5]++)
	for(move[6] = 0; move[6] < 4; move[6]++)
	for(move[7] = 0; move[7] < 4; move[7]++)
	for(move[8] = 0; move[8] < 4; move[8]++)
	for(move[9] = 0; move[9] < 4; move[9]++)
	{
		if((
		(clock[1]+move[1]+move[2]+move[4])%4 ||
		(clock[2]+move[1]+move[2]+move[3]+move[5])%4 ||
		(clock[3]+move[2]+move[3]+move[6])%4 ||
		(clock[4]+move[1]+move[4]+move[5]+move[7])%4 ||
		(clock[5]+move[1]+move[3]+move[5]+move[7]+move[9])%4 ||
		(clock[6]+move[3]+move[5]+move[6]+move[9])%4 ||
		(clock[7]+move[4]+move[7]+move[8])%4 ||
		(clock[8]+move[5]+move[7]+move[8]+move[9])%4 ||
		(clock[9]+move[6]+move[8]+move[9])%4) ==0)
		{
			for(int j = 1; j < 10; j++)
			answer[j] = move[j];
			goto finish;
		}
	}
	
finish:
	for(i = 1; i < 10; i++)
	if(answer[i])
	break;
	printf("%d",i);
	answer[i]--;
	
	for(i = 1;i < 10; i++)
	while(answer[i]-- > 0)
	printf(" %d",i);
	return 0;
}
