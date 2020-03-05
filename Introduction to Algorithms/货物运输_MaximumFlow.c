/*
 * Description
 * 在一个工厂货物运输系统中共有N个节点, 编号为1,2,3,…,N,节点之间有传送带（单向）连接
 * 每个传送带都有使用寿命, 传送带的寿命为一个数字L, 表示在传送完L个单位的货物后, 传送带就会破损无法使用。
 * 现在需要从节点S向节点T传送货物, 求在当前传输系统中, 最多可以顺利传输多少单位的货物从节点S到节点T
 *
 * Input
 * 第一行为4个整数, N M S T, 分别代表节点个数、传送带数目、起点标号S、目标点标号T
 * 接下来M行, 每行表述一条传送带的信息, 表述为Ui Vi Li的形式, 表示一条从节点Ui到节点Vi, 寿命为Li的传送带
 *
 * 数据规模
 * 对于所有数据, 满足1≤Ui≤N, 1≤Vi≤N, 1≤Li≤100
 * 40％的数据, 2≤N≤50, 2≤M≤500
 * 100％的数据, 2≤N≤500, 2≤M≤20,000
 *
 * Output
 * 输出一个整数, 表示在当前传输系统中, 最多可以顺利传输多少单位的货物从节点S到节点T
 * */

#include <stdio.h>
#include <limits.h>

int capacity[501][501] = {0};
int flow[501][501] = {0};
int pre[501] = {0};
int available[501];
int N, M, S, T;
int queue[501];
int head, tail;

int min(int a, int b)
{
    return a>b ? b : a;
}

int BFS()
{
    for (int i = 0; i < 501; ++i) {
        available[i] = 0;
    }
    available[S] = INT_MAX;

    head = tail = 0;
    queue[tail++] = S;
    while(head != tail) {
        int u = queue[head++];
        int v;
        for (v = 1; v <= N; v++) {
            if (available[v] == 0 && capacity[u][v] > flow[u][v]) {
                pre[v] = u;
                available[v] = min(available[u],capacity[u][v] - flow[u][v]);
                queue[tail++] = v;
            }
        }
    }
    if (available[T] == 0)
        return 0;
    for (int u = T; u != S; u = pre[u]) {
        flow[pre[u]][u] += available[T];
        flow[u][pre[u]] -= available[T];
    }
    return available[T];
}

int main() {

    scanf("%d%d%d%d", &N, &M, &S, &T);

    int i;
    for (i = 0; i < M; i++) {
        int u, v, L;
        scanf("%d%d%d", &u, &v, &L);
        capacity[u][v] += L;
    }

    int total = 0;
    int f;
    f = BFS();
    while (f) {
        total += f;
        f = BFS();
    }

    printf("%d", total);
    return 0;
}
