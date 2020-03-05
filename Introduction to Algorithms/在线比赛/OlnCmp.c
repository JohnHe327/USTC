/*
 * Description
 * 学校举办了一个在线ACM比赛，现有一个时间榜单。小明想随时知道目前榜单上面排名第k的人的运行时间。
 * 但是这个榜单由于一些原因会动态变化，具体情况如下：
 * 1.由于新增加选手，榜单可能会有新的时间出现。
 * 2.由于检测到某选手有犯规行为，榜单上的时间可能会被删除。
 * 3.询问时间第k小的人的时间。
 *
 * Input
 * 第一行一共一个数字n，代表接下来一共会有n行输入。
 * 从第二行开始接下来会有n行输入，每行一个字符和一个数字，用空格隔开。字符一共有三种情况：
 * 字符I，代表插入一个时间，字符后面的数字代表插入的时间。
 * 字符D，代表删除一个时间，字符后面的数字代表删除的时间，这里保证待删除的时间一定存在。
 * 字符K，代表一个查询，字符后面的数字k代表查询第k小的时间，这里保证第k小的时间一定存在。
 * 数据规模：
 * 0<n≤2000000
 *
 * Output
 * 对每行查询输出查询的结果，表示查询时第k小的时间。
 * */

#include <stdio.h>
#include <stdlib.h>
#include "BinaryTree.h"

int main()
{
    BTNode *root = InitBinaryTree();
    int n;
    scanf("%d",&n);
    char Op;
    int key, piv;
    while(n--){
        while(getchar() != '\n');
        Op = getchar();
        switch(Op){
            case 'I':
                scanf("%d", &key);
                BTNode *pNew = CreatNode(key);
                TreeInsert(&root, pNew);
                break;
            case 'D':
                scanf("%d", &key);
                BTNode *del = TreeSearch(root, key);
                if(del != nil){
                    del = TreeDelete(&root,del);
                    free(del);
                }
                break;
            case 'K':
                scanf("%d", &piv);
                BTNode *p = OSSelect(root, piv);
                printf("%d\n",p->key);
                break;
            default:
                PreOrderTreeWalk(root);
                break;
        }
    }
    return 0;
}