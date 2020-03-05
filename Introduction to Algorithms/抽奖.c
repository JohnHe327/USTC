/*
 * Description
 * 某次晚会，主办方给观众准备了一个抽奖活动，抽奖规则如下：
 * 主持人会在大屏幕上随机产生一个数字k，
 * 然后观众通过手机在抽奖系统中输入一个0到10000之间的数字（包括0和10000），
 * 此时中奖观众将会是所有观众中输入的第k小的人，请输出获奖观众选择的数字。
 * 
 * Input 
 * 输入数据共两行。
 * 第一行有两个数字，第一个数字n代表总共的人数，第二个数字k。
 * 第二行有n个数字，每个数字代表了每个观众输入的数字ai。
 * 数据规模：
 * 0<k≤n≤10^7
 * 0≤ai≤10,000
 * 
 * Output 
 * 输出共一行包含一个数字，表示获奖观众输入的数字。
 * */

#include <stdio.h>
#include <stdlib.h>
int comp(const void *a,const void *b);
int RandomSelect(int A[],int p,int r,int i);

int main()
{
	int n,k,key;
	scanf("%d %d",&n,&k);
	int A[n];
	for(int i = 0;i < n;i++){
		scanf("%d",&A[i]);
	}
	
	qsort(A,n,sizeof(int),comp);
	key = RandomSelect(A,0,n-1,k);
	printf("%d",key);
	return 0;
}

int comp(const void *p,const void *q)
{
	int a = *(int *) p;
	int b = *(int *) q;
	if(a < b) return (-1);
	else if(a > b) return 1;
	else return 0;
}

int RandomSelect(int A[],int p,int r,int i)
{
	if(p == r) return A[p];
	int q = (p + r)/2;
	int k = q - p + 1;
	if(i == k) return A[q];
	else{
		if(i < k)
			return RandomSelect(A,p,q-1,i);
		else
			return RandomSelect(A,q+1,r,i-k);
	}
}
