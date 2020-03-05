/* Description
 * 勤奋的小明为了预习下学期的数据库课程，决定亲自实现一个简单的数据库系统。
 * 该数据库系统需要处理用户的数据库插入和查询语句，并输出相应的输出。
 * 具体来说，用户的输入共包含若干条插入语句和查询语句。
 * 其中每条插入语句包含一个非负整数表示需要插入的数据。
 * 每条查询语句包含一个整数表示待查询的键值，若该键值存在则直接输出该键值，否则输出数据库中比该键值小的最大键值。
 *
 *  Input
 *  首先是若干行插入语句，每行的格式为如下的一种：
 *  INSERT key
 *  FIND key
 *  最后单独的一行EXIT表示输入结束
 *
 *  数据规模：
 *  插入语句和查询语句一共不超过2,000,000条
 *  0≤key≤10^9
 *
 *  Output
 *  对每条查询语句输出一行，每行输出1个数字，表示查询的结果。
 *  该键值存在则直接输出该键值，否则输出数据库中比该键值小的最大键值
 * */

#include <stdio.h>
#include "RBTree.h"

int main() {
    char lookahead;
    int key;
    RBNode *root = InitRBTree();
    RBNode *p;

    lookahead = getchar();
    while(lookahead != 'E'){
        switch(lookahead){
            case 'I':
                scanf("NSERT %d", &key);
                p = CreatRBNode(key);
                RBTreeInsert(&root, p);
                break;
            case 'F':
                scanf("IND %d", &key);
                p = RBTreeSearch(root, key);
                if(p != nil)
                    printf("%d\n", p->key);
                else{
                    p = CreatRBNode(key);
                    RBTreeInsert(&root, p);
                    printf("%d\n", RBTreePredecessor(p)->key);
                    p = RBTreeDelete(&root, p);
                    free(p);
                }
                break;
            default:;
        }
        lookahead = getchar();
    }
    return 0;
}