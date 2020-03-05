/*
 * Description
 * 你需要求出模式串P在原串S中出现的次数, 模式串和原串中的字母均为小写, 数据有多组, 每组输出一个答案
 *
 * Input
 * 第一行为一个整数T, 表示你需要处理的数据组数
 * 接下来T组, 每组第一行为模式串P, 第二行为原串S
 *
 * 数据规模：
 * 2≤T≤20
 * 对于40%的数据, 模式串长度不超过1000, 原串长度不超过10,000
 * 对于100%的数据, 模式串长度不超过10,000, 原串长度不超过1,000,000
 *
 * Output
 * 输出T行, 分别为每一组的答案
 * */

#include <stdio.h>
#include <string.h>

int main() {
    int T;
    scanf("%d", &T);
    while (T--) {
        int count = 0;
        char p[10000];
        char s[1000000];
        scanf("%s%s", p, s);
        int pLen = strlen(p);
        int sLen = strlen(s);
        int i;

        int Prefix[pLen];
        for (i = 1; i <= pLen; i++)
            Prefix[i - 1] = 0;
        int k = 0;
        for (i = 2; i <= pLen; i++) {
            while (k > 0 && p[k] != p[i - 1])
                k = Prefix[k - 1];
            if (p[k] == p[i - 1])
                k++;
            Prefix[i - 1] = k;
        }

        k = 0;
        for (i = 1; i <= sLen; i++) {
            while (k > 0 && p[k] != s[i - 1])
                k = Prefix[k - 1];
            if (p[k] == s[i - 1])
                k++;
            if (k == pLen) {
                count++;
                k = Prefix[k - 1];
            }
        }
        printf("%d\n",count);
    }
    return 0;
}
