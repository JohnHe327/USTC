/*
 * Description
 * 现有N个村庄排成一排，在这些村庄里须要挑选若干村庄搭建基站，其中基站的覆盖半径为R
 * 假设在村庄i处放置基站，村庄i的坐标为Xi，则处在[Xi-R,Xi+R]范围内的村庄都能被该基站所覆盖
 * 再给出所有村庄坐标的情况下，求使所有村庄都能被基站覆盖所需要的最少基站个数
 *
 * Input
 * 第一行包含两个整数N，R分别表示村庄个数和基站覆盖半径
 * 接下来的N行每行一个整数Xi表示村庄i的坐标
 *
 * 数据规模
 * N≤100000
 * R≤1000
 * Xi≤1000000
 *
 * Output
 * 输出一个整数表示最少需要搭建的基站数目
 * */

#include <stdio.h>
#include <stdlib.h>

int comp(const void * x, const void * y)
{
    int a = *(int *)x;
    int b = *(int *)y;
    if (a < b)
        return -1;
    else if (a > b)
        return 1;
    else
        return 0;
}

int main()
{
    int N, R;
    scanf("%d%d", &N, &R);
    int village[N];
    for (int i = 0; i < N; i++)
        scanf("%d", &village[i]);
    qsort(village,N,sizeof(int),comp);
    int total = 0;
    int i = 0;
    while (i < N) {
        int p = i;
        while (p + 1 < N && village[p + 1] - village[i] <= R)
            p = p + 1;
        total++;
        i = p;
        while(i + 1 < N && village[i + 1] - village[p] <= R)
            i = i + 1;
        i++;
    }
    printf("%d", total);
}