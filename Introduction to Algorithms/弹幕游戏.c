/*
 * Description
 * 某天小明闲着无聊，在寝室玩一款弹幕游戏。现有一个数轴，在该数轴上面有n个点，每个点代表一个敌人。
 * 小明控制的主角是一个直径为d的圆，小明的目标是从数轴的下方移动到数轴的上方，但是不能碰到任何敌人
 * （如果两个敌人之间距离为1，主角直径也为1，这种情况不算碰到敌人）
 * 求主角的直径d至多可以达到多少。（不允许主角从所有敌人的最左边，或者所有敌人的最右边穿过数轴）
 * 
 * Input
 * 一共两行，第一行有一个整数n
 * 第二行一共有n个整数ai（互不相同），代表了每个敌人在数轴上的坐标（这一行数字是乱序的）
 * 0<n≤10,000,000
 * 0≤ai≤1e9
 * 
 * Output
 * 主角直径d最大值
 * */

#include <stdio.h>
#include <stdlib.h>

int comp(const void * a, const void * b)
{
	int p = *(int *)a;
	int q = *(int *)b;
	if(p < q) return -1;
	else if(p > q) return 1;
	else return 0;
}

int main()
{
	int n;
	scanf("%d", &n);
	int a[n];
	int i, k = 0;
	for(i = 0; i < n; i++)
		scanf("%d", &a[i]);
	qsort(a,n,sizeof(int),comp);
	
	for(i = 0; i < n - 1; i++)
		a[i] = a[i+1] - a[i];
	
	for(i = 0; i < n -1; i++)
		if(a[k] < a[i])
			k = i;
	printf("%d", a[k]);
	return 0;
}
