/* Description
 * C语言中需要申请一块连续的内存时需要使用malloc等函数。
 * 如果分配成功则返回指向被分配内存的指针(此存储区中的初始值不确定)，否则返回空指针NULL
 * 现在小明决定实现一个类似malloc的内存分配系统，
 * 具体来说，他需要连续处理若干申请内存的请求，这个请求用一个闭区间[ai..bi]来表示。
 * 当这个区间和当前已被申请的内存产生重叠时，则返回内存分配失败的信息。
 * 否则返回内存分配成功，并将该区间标记为已被占用
 * 假设初始状态下内存均未被占用，管理的内存地址范围为0~1GB（0~2^30）
 *
 * Input
 * 输入数据共n+1行
 * 第一行一个整数n表示共需要处理n次内存分配
 * 然后是n行数据，每行的格式为ai bi
 * 表示申请区间为[ai,bi]
 *
 * 数据规模：
 * n≤1,000,000
 * 0<ai≤bi≤2^30
 *
 * Output
 * 输出共n行
 * 对于每行内存分配的申请，若申请成功则输出一行0，若申请失败则输出一行−1
 * */

#include <stdio.h>
#include "IntervalTree.h"

int main() {
    int n;
    Interval key;
    IntervalNode *p;
    IntervalNode *root = InitIntervalTree();
    scanf("%d", &n);
    while(n--){
        scanf("%d %d", &key.low, &key.high);
        if(IntervalSearch(root, key) == nil){
            p = CreatNode(key);
            if(p != NULL)
                IntervalInsert(&root, p);
            printf("0\n");
        }
        else
            printf("-1\n");
    }
    return 0;
}