/*
 * Description
 * 给定一个长为n的int类型数组A，将该数组排序。
 * 
 * Input 
 * 第一行包含一个正整数n。
 * 第二行由n个正整数
 * a1,a2,a3,…,an组成。
 * 数据规模：
 * 1≤n≤1e7
 * ∣ai∣≤1e9
 * 
 * Output 
 * n个从小到大排好序的整数。
 * */

#include <stdio.h>
#include <stdlib.h>
int comp(const void *p,const void *q);

int main()
{
	int n;
	scanf("%d",&n);
	int A[n];
	for(int i = 0;i < n;i++)
		scanf("%d",&A[i]);
	qsort(A,n,sizeof(int),comp);
	for(int i = 0;i < n;i++)
		printf("%d ",A[i]);
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
