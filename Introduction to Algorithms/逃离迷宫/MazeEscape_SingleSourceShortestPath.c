/*
 * Description
 * 小明被困在一个迷宫之中，迷宫中共有N个点，标号分别为1,2,3…N，且迷宫只有一个出口。
 * N个点之间互相有一些道路连通(单向)，两个点之间可能有多条道路连通，但是并不存在一条两端都是同一个点的道路。
 * 小明希望知道从当前位置S去往出口T的最短距离是多少。
 * 如果不存在去往出口的道路，输出−1
 *
 * Input
 * 第一行为4个整数, N M S T, 分别代表节点个数、道路条数、小明当前所处的位置的标号、出口标号
 * 接下来M行, 每行表述一条道路, 表述为Ui Vi Wi的形式, 表示一条从Ui到Vi, 距离为Wi的单向边
 * 对于所有数据, 1≤Ui,Vi≤N, 1≤Wi≤100
 *
 * 数据规模
 * 30％的数据, 2≤N≤100, 0≤M≤500
 * 60％的数据, 2≤N≤1000, 0≤M≤20000
 * 100％的数据, 2≤N≤10^5, 0≤M≤10^6
 *
 * Output
 * 如果小明能逃离迷宫，输出从他的位置到出口的最短距离
 * 否则输出-1
 * */

#include <stdio.h>
#include <limits.h>
#include <stdlib.h>
#include "FibonacciHeap.h"

int main() {
    int M, S, T;
    scanf("%d%d%d%d", &N, &M, &S, &T);
    fibNode *vertex[N + 1];
    int i;

    for (i = 0; i <= N; i++) {
        vertex[i] = (fibNode *)malloc(sizeof(fibNode));
        vertex[i]->vertex.number = i;
        vertex[i]->vertex.distance = INT_MAX;
        vertex[i]->vertex.nextEdge = NULL;
        vertex[i]->mark = 0;
        vertex[i]->degree = 0;
        vertex[i]->leftSib = vertex[i]->rightSib = vertex[i];
        vertex[i]->child = vertex[i]->parent = NULL;
    }

    for (i = 0; i < M; i++) {
        int u;
        scanf("%d", &u);
        edge* e = (edge *)malloc(sizeof(edge));
        scanf("%d%d", &e->v, &e->weight);
        e->nextEdge = vertex[u]->vertex.nextEdge;
        vertex[u]->vertex.nextEdge = e;
    }

    vertex[1]->leftSib = vertex[N];
    vertex[1]->rightSib = vertex[2];
    for (i = 2; i < N; i++) {
        vertex[i]->leftSib = vertex[i - 1];
        vertex[i]->rightSib = vertex[i + 1];
    }
    vertex[N]->leftSib = vertex[N - 1];
    vertex[N]->rightSib = vertex[1];
    vertex[S]->vertex.distance = 0;
    min = vertex[S];

    consolidateFibHeap();

    while (min != NULL) {
        fibNode *u = extractMIN();
        if (u == vertex[T])
            break;

        edge *e = u->vertex.nextEdge;
        while (e != NULL) {
            if (vertex[e->v]->vertex.distance > u->vertex.distance + e->weight)
                decreaseKey(vertex[e->v],u->vertex.distance + e->weight);
            e = e->nextEdge;
        }
    }

    if (vertex[T]->vertex.distance == INT_MAX)
        printf("-1");
    else
        printf("%d", vertex[T]->vertex.distance);
    return 0;
}
