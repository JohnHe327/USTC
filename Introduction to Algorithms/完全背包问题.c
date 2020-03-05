/* 完全背包问题
 * Description
 * 现有一个背包可以容纳总重量为W的物品，有n种物品可以放入背包，其中每种物品单个重量为wi，价值为vi，可选数量为numi
 * 输出可以放入背包的物品的最大总价值
 *
 * Input
 * 第一行两个整数n,W，分别表示物品件数和背包容量
 * 然后n行数据描述每种物品的重量、价值和可选数量
 * 每行的格式为wi vi numi
 *
 * 数据规模：
 * 1≤n≤200
 * 1≤W≤10000
 * 1≤wi≤1000
 * 1≤vi≤1000
 * 1≤numi≤10000
 * 所有输入数据均为整数
 *
 * Output
 * 输出一个整数表示可以装入背包的最大价值
 * */

#include <stdio.h>

int min(int a, int b)
{
    return a<b ? a : b;
}

int max(int a, int b)
{
    return a>b ? a : b;
}

int main() {
    int n, W;
    scanf("%d %d", &n, &W);
    int weight[n], value[n], num[n];
    for (int i = 0; i < n; i++)
        scanf("%d %d %d", &weight[i], &value[i], &num[i]);

    int result[n][W + 1];
    for (int i = 0; i < n; i++)
        result[i][0] = 0;

    for (int i = 0; i < n; i++) {
        for (int j = 1; j <= W; j++) {
            if (i == 0) {
                result[i][j] = value[i] * min(num[i], j/weight[i]);
            } else {
                result[i][j] = result[i - 1][j];
                for (int k = 1; k <= num[i]; k++) {
                    if (j - k * weight[i] >= 0)
                        result[i][j] = max(result[i][j], result[i - 1][j - k * weight[i]] + k * value[i]);
                    else
                        break;
                }
            }
        }
    }

    printf("%d", result[n - 1][W]);
    return 0;
}