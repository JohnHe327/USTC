/*
 * Description
 * 对于二维平面上的任意两点A(x1,y1),B(x2,y2)，定义偏序关系≤，表示x1≤x2且y1≤y2
 * 现给定平面上的若干点，求最大的点子集S使得集合中的任意两点之间均满足偏序关系≤
 * 即对∀A,B∈S，A≤B或B≤A成立
 * 只需要输出子集S的大小|S|
 *
 * Input
 * 第一行一个整数n表示点的个数
 * 然后是n行输入，表示n个点的坐标，其中每行格式为
 * xi yi
 * 点的横纵坐标均为整数，且输入数据不会出现重叠的点
 *
 * 数据规模：
 * 0＜n≤10000
 * 0≤xi,yi≤10000
 *
 * Output
 * 输出一个整数表示最大可能的子集|S|的大小
 * */

#include <stdio.h>
#include <stdlib.h>

typedef struct Node{
    int x,y;
    int count;
}node;
node input[10001];

int max(int x, int y)
{
    return x>y ? x : y;
}

int POSET(node a,node b)
{
    return (b.x >= a.x && b.y >= a.y);
}

int comp(const void * x, const void * y)
{
    node *a = (node *)x;
    node *b = (node *)y;
    if(a->x + a->y > b->x + b->y)
        return 1;
    else if (a->x + a->y < b->x + b->y)
        return -1;
    else{
        if(a->x > b->x)
            return 1;
        else if(a->x < b->x)
            return -1;
        else
            return 0;
    }
}

int main() {
    int n;
    scanf("%d", &n);
    int i, j;
    for(i = 0; i < n; i++){
        scanf("%d %d", &input[i].x, &input[i].y);
        input[i].count = 1;
    }
    qsort(input,n,sizeof(node),comp);

    int result = 1;
    for(i = n - 2; i >= 0; i--){
        for(j = i + 1; j < n; j++){
            if(POSET(input[i],input[j])){
                input[i].count = max(input[i].count, input[j].count + 1);
            }
        }
    }
    for(i = 0; i < n; i++)
        result = max(result, input[i].count);
    printf("%d",result);
    return 0;
}