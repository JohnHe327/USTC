/*
 * Description
 * 程序员小明需要将n个有序数组合并到一起
 * 由于某种工程上的原因，小明只能使用一个系统函数Merge将两个相邻的数组合并为一个数组。
 * Merge函数合并两个长度分别为n1,n2的数组的时间为n1+n2
 * 现给定n个数组的长度，小明需要求出最小需要的合并时间
 *
 * Input
 * 输入共两行
 * 第一行一个整数n表示待归并的数组个数
 * 第二行n个整数，第i个整数表示第i个数组的长度
 *
 * 数据规模：
 * 0＜n≤200
 * 每个数组的长度均为整数，且输入数据保证最终结果范围在int32之内
 *
 * Output
 * 输出共一个数字，表示最小需要的归并时间
 * */

#include <stdio.h>
#include <limits.h>

int main() {
    int n;
    scanf("%d", &n);
    int input[n + 1];
    int totallen[n + 1];
    int i;
    input[0] = 0;
    for(i = 1; i <= n; i++){
        scanf("%d", &input[i]);
    }
    totallen[0] = input[0];
    for(i = 1; i <= n; i++)
        totallen[i] = totallen[i - 1] + input[i];

    int cost[n + 1][n + 1];
    for(int j = 1; j <= n; j++)
        cost[j][j] = 0;
    for(i = 1; i < n; i++){
        for(int j = 1; j + i <= n; j++){
            int temp = INT_MAX;
            for(int k = 0; k < i; k++){
                if(temp > cost[j][j + k] + cost[j + k + 1][j + i] + totallen[j + i] - totallen[j - 1])
                    temp = cost[j][j + k] + cost[j + k + 1][j + i] + totallen[j + i] - totallen[j - 1];
            }
            cost[j][j + i] = temp;
        }
    }

    printf("%d", cost[1][n]);
    return 0;
}