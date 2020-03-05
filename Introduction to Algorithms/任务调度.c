/*
 * Description
 * 现有N个任务需要在一台机器上进行调度，其中每个任务有相应的到达时间ri和执行时间pi
 * 任务必须在到达之后才能进行执行，该机器同时只能执行一个任务。当一个任务在机器上执行pi时间后，该任务即视为完成
 * 若该任务的完成时刻为fi，则该任务的响应时间为fi−ri+1
 * 我们需要找到一个调度方案使所有任务的响应时间之和最短
 * 需要说明的是，在这个问题里我们假设已经将时间划分为若干不可再分的时隙，即一个任务最少的执行时间为1个单位时间，且任务只会在整数时刻到达
 * 此外，调度是可抢占的，这意味着在任意时隙开始时可以通过挂起正在执行的任务i转而执行另一项任务j，随后可以恢复任务i并执行其剩余的工作
 *
 * Input
 * 第一行一个整数N表示总共的任务个数
 * 接下来的N行，每行两个整数ri,pi表示任务的到达时间和执行时间
 *
 * 数据规模：
 * N≤100,000
 * ri≤10,000,000
 * pi≤1,000
 *
 * Output
 * 输出一个整数表示最小的所有任务的总响应时间
 * */

#include <stdio.h>
#include <stdlib.h>

typedef struct Task {
    int r, p, f;
} task;
task job[100001];
int qhead, qtail;

int compr(const void * x, const void * y)
{
    task a = *(task *)x;
    task b = *(task *)y;
    if (a.r < b.r)
        return -1;
    else if (a.r > b.r)
        return 1;
    else
        return 0;
}

int qEmpty()
{
    return qhead == qtail;
}

void EnQueue()
{
    qtail++;
}

void DeQueue()
{
    qhead++;
}

int main() {
    int N = 0;
    scanf("%d",&N);
    int i;
    for (i = 0; i < N; ++i) {
        scanf("%d %d", &job[i].r, &job[i].p);
    }
    qsort(job,N,sizeof(task),compr);

    int time = 0;
    qhead = qtail = 0;
    i = 0;
    while (time <= job[N - 1].r || !qEmpty()) {
        while (i < N && time == job[i].r) {
            EnQueue();
            i++;
        }

        int p = qhead;
        for (int k = qhead; k < qtail; k++) {
            if (job[k].p < job[p].p)
                p = k;
        }
        if (p != qhead) {
            task temp = job[qhead];
            job[qhead] = job[p];
            job[p] = temp;
        }

        if (!qEmpty()) {
            if (i >= N) {
                time += job[qhead].p;
                job[qhead].p = 0;
                job[qhead].f = time;
                DeQueue();
            } else {
                if (job[i].r - time >= job[qhead].p) {
                    time += job[qhead].p;
                    job[qhead].p = 0;
                    job[qhead].f = time;
                    DeQueue();
                } else {
                    job[qhead].p -= job[i].r - time;
                    time = job[i].r;
                }
            }
        } else
            time = job[i].r;
    }

    unsigned int total = 0;
    for (i = 0; i < N; ++i) {
        total += job[i].f - job[i].r;
    }
    printf("%u",total);
    return 0;
}