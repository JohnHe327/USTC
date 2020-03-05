/*
 * Description
 * 现有n个学生排成一个固定队伍进行军训，教官小明有一份所有n个人的名单（不同的人可能重名）
 * 小明想要在整个队伍中找到一个连续的子队伍，并且满足该子队的所有人恰好有k个不重复的名字
 * 请帮小明计算一下一共有多少种可能的子队伍
 *
 * Input
 * 一共有两行，第一行有两个数字n和k，用空格分隔
 * 第二行有n个单词namei，用空格分隔
 * 输入保证len(namei)≤5（即输入的名字最多只含有5个字符）
 *
 * 数据规模：
 * 0＜k＜n≤10,000,000
 *
 * Output
 * 输出一共一个数字，即可能的子队伍数量
 * */

#include <stdio.h>

unsigned int input[10000000];
int h1[14348907] = {0}, h2[14348907] = {0};

unsigned int hash(char *str)
{
    unsigned int hash = 0;
    while(*str){
        hash = hash * 27 + (unsigned int)(*str) - 0x60;
        str++;
    }
    return hash;
}

int main() {
    int n, k;
    scanf("%d %d", &n, &k);
    char temp[6];
    for(int i = 0; i < n; i++){
        scanf("%s", temp);
        input[i] = hash(temp);
    }

    int cnt1 = 0, cnt2 = 0;
    int ans = 0;
    int l = 0, r = 0;
    for(int j = 0; j < n; j++){
        if(h1[input[j]] == 0)
            cnt1++;
        if(h2[input[j]] == 0)
            cnt2++;
        h1[input[j]]++;
        h2[input[j]]++;

        while(cnt1 > k)
            if(--h1[input[l++]] == 0)
                cnt1--;
        while(cnt2 > k - 1)
            if(--h2[input[r++]] == 0)
                cnt2--;

        if(cnt1 == k)
            ans += r - l;
    }
    printf("%d",ans);
    return 0;
}