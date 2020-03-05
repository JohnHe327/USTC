/*
 * Description
 * 小明是一个炒股爱好者，他准备分析某股票的历史交易信息。
 * 于是小明列出了该股票的历史价格，为数组A，数组中的每一个元素代表了第i天股票的价格，
 * 小明发现在股票的历史记录中有非常多类似于i<j，Ai>Aj的情况，
 * 在这些情况下，如果在第i天买入股票，并且在第j天卖出股票就会亏本，
 * 请你帮小明计算出，所有历史记录中，一共有多少个满足i<j，Ai>Aj的(i,j)对。
 * 
 * Input 
 * 输入一共两行，第一行为一个数字n，代表数组A的元素数目，即一共有多少天。
 * 第二行一共有n个数字，代表每一天的股票价格。
 * 假定股票价格为整数。
 * 0< n ≤1,000,000
 * 0≤Ai ≤1e9
 * 
 * Output 
 * 输出共一个整数。
 * 因为输出值可能非常大，请将输出的答案模10,000,019 
 * */

#include <stdio.h>
#include <stdlib.h>
typedef struct stock
{
	int price;
	int count;
} stock;

void MergeSort(stock *A,int start,int end);

int main()
{
	int n;
	scanf("%d",&n);
	stock A[n];
	for(int i = 0; i < n; i++){
		scanf("%d", &A[i].price);
		A[i].count = 0;
	}
	MergeSort(A,0,n-1);
	
	int total = 0;
	for(int i = 0; i < n; i++){
		total += A[i].count;
		if(total >= 10000019) total -= 10000019;
	}
	printf("%d",total);
	return 0;
}

void MergeSort(stock *A,int start,int end)
{
	int mid = (start + end) / 2;
	if(start < mid) MergeSort(A,start,mid);
	if(mid+1 < end) MergeSort(A,mid+1,end);
	int i,j;
	for(i = start, j = mid +1; i <= mid && j <= end; ){
		if(A[i].price > A[j].price){
			A[j].count += mid - i + 1;
			j++;
		}
		else i++;
	}
	
	stock B[end-start+1];
	for(i = start; i <= end; i++)
		B[i-start] = A[i];

	int k = start;
	for(i = 0, j = mid - start + 1; i <= mid - start && j <= end - start; ){
		if(B[i].price > B[j].price){
			A[k] = B[j];
			k++;j++;
		}
		else{
			A[k] = B[i];
			k++;i++;
		}
	}
	if(i > mid - start)
		while(j <= end - start)
			A[k++] = B[j++];
	else if(j > end - start)
		while(i <= mid - start)
			A[k++] = B[i++];
}
