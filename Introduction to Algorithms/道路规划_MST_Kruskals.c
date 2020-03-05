/*
 * Description
 * 沙漠上，新建了N座城市，用1,2,3...N表示，城市与城市之间还没有道路，现在需要建设这些城市的道路网络，需要在城市间修建道路
 * 施工队给出了M条道路的预计费用信息，每条道路的预计费用信息可以表示为Ui,Vi,Wi，即如果要在Ui和Vi之间修建道路，预计费用为Wi
 * 道路是双向的，现从M条道路中选择一定数量的道路来修建，使得这些城市之间两两之间可达，可以通过其他城市间接到达
 * 你需要求出达成上述条件的最少预算
 *
 * Input
 * 第1行为2个整数N，M，表示示城市数量和施工队给出的M条道路的预计费用信息
 * 接下来M行，每行描述一条道路的的预计费用信息，形式为Ui Vi Wi
 * 对于所有数据，满足M≥N-1，1≤Ui,Vi≤N，1≤Wi≤100
 * 对于100%的数据，满足一定存在一种方案，使得任意两座城市都可以互相到达，且一条道路仅会出现一次
 *
 * 数据规模
 * 30％的数据, 2≤N≤100, 2≤M≤500
 * 60％的数据, 2≤N≤1000, 2≤M≤5000
 * 100％的数据, 2≤N≤10^5, 2≤M≤10^6
 *
 * Output
 * 输出一个数字，表示使得所有城市连通的最少预算
 * */

#include <stdio.h>
#include <stdlib.h>

typedef struct Edge{
    int u, v, w;
}edge;

int comp(const void *a, const void *b)
{
    edge x = *(edge *)a;
    edge y = *(edge *)b;
    if (x.w > y.w)
        return 1;
    else if (x.w < y.w)
        return -1;
    else
        return 0;
}

int min(int a, int b)
{
    return a>b ? b : a;
}

int main() {
    int M, N;
    int i;
    scanf("%d%d", &N, &M);
    edge road[M];
    for (i = 0; i < M; i++)
        scanf("%d%d%d", &road[i].u, &road[i].v, &road[i].w);
    qsort(road, M, sizeof(edge), comp);

    int vertexSet[N + 1];
    for (i = 0; i <= N; i++) {
        vertexSet[i]=i;
    }

    int totalCost = 0, edgeCount = 0;
    i = 0;
    while (i < M && edgeCount < N - 1) {
        int u = vertexSet[road[i].u];
        int v = vertexSet[road[i].v];
        while (u != vertexSet[u])
            u = vertexSet[u];
        while (v != vertexSet[v])
            v = vertexSet[v];
        if (u != v) {
            vertexSet[u] = vertexSet[v] = min(u,v);
            totalCost += road[i].w;
            edgeCount++;
        }
        i++;
    }

    printf("%d",totalCost);
    return 0;
}
