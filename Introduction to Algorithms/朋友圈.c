/*
 * Description
 * 小明的班上一共有n个人，每个人都有他自己的朋友，现我们假设朋友这个关系是可以传递的。
 * 如果学生1和学生2是朋友关系，学生2和学生3是朋友关系，那么我们认为学生1和学生3也为朋友关系。
 * 现已知各个学生之间的朋友关系，并给出k个询问，请回答这k个询问。
 *
 * Input
 * 第一行有三个数字n，k，m，用空格隔开。
 * 接下来有m行，每行2个数字，代表这两个标号的同学是朋友关系。
 * 再接下来有k行，每行2个数字，代表询问这两个标号的同学是否是朋友关系。
 *
 * 数据规模：
 * 0<n,m,k≤5,000,000
 *
 * Output
 * 一共有一行数字用空格隔开，代表k次查询的结果，0代表不是朋友，1代表朋友。
 * */

#include <stdio.h>

typedef struct stu{
    int head,next;
} stu;

int main() {
    int n, m, k;
    scanf("%d %d %d", &n, &k, &m);
    stu list[n], head[n];
    int count[n];
    for(int i = 0; i < n; i++){
        list[i].head = i;
        list[i].next = -1;
        head[i].head = i;
        head[i].next = i;
        count[i] = 1;
    }
    int a, b, temp;

    while(m--){
        scanf("%d %d", &a, &b);
        a = head[list[a].head].head;
        b = head[list[b].head].head;
        if(a == b) continue;
        if(count[a] > count[b]){
            list[head[a].next].next = b;
            head[a].next = head[b].next;
            temp = b;
            while(temp != -1){
                list[temp].head = list[a].head;
                temp = list[temp].next;
            }
            count[a] += count[b];
        }
        else{
            list[head[b].next].next = a;
            head[b].next = head[a].next;
            temp = a;
            while(temp != -1){
                list[temp].head = list[b].head;
                temp = list[temp].next;
            }
            count[b] += count[a];
        }
    }

    while(k--){
        scanf("%d %d", &a, &b);
        printf("%d ", list[a].head == list[b].head);
    }
    return 0;
}