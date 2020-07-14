// 多体问题

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>
#include <mpi.h>
#define N 256       // 天体个数
#define CYCLE 20000 // 周期数
double delta_t = 1.0 / 100;
const double GM = 6.67E-11 * 1E4; // G * M

typedef struct ball
{
    double pos_x, pos_y;
    double v_x, v_y;
    double acc_x, acc_y;
} ball;
ball ball_list[256];

void compute_force(int index)
{
    ball_list[index].acc_x = 0;
    ball_list[index].acc_y = 0;
    for (int i = 0; i < N; i++)
        if (i != index)
        {
            double dx = ball_list[i].pos_x - ball_list[index].pos_x;
            double dy = ball_list[i].pos_y - ball_list[index].pos_y;
            double d = (dx * dx + dy * dy);
            d *= sqrt(d); // ^(3/2)
            ball_list[index].acc_x += GM * (dx) / d;
            ball_list[index].acc_y += GM * (dy) / d;
        }
}

void compute_velocities(int index)
{
    ball_list[index].v_x += ball_list[index].acc_x * delta_t;
    ball_list[index].v_y += ball_list[index].acc_y * delta_t;
}

void compute_positions(int index)
{
    ball_list[index].pos_x += ball_list[index].v_x * delta_t;
    ball_list[index].pos_y += ball_list[index].v_y * delta_t;
}

int main(int argc, char *argv[])
{
    // init
    int size = (int)sqrt(N);
    for (int i = 0; i < N; i++)
    {
        ball_list[i].pos_x = i % size;
        ball_list[i].pos_y = i / size;
        ball_list[i].v_x = 0;
        ball_list[i].v_y = 0;
        ball_list[i].acc_x = 0;
        ball_list[i].acc_y = 0;
    }
    int my_rank, num_procs;
    clock_t start_time, end_time;

    MPI_Init(&argc, &argv);
    MPI_Comm_size(MPI_COMM_WORLD, &num_procs);
    MPI_Comm_rank(MPI_COMM_WORLD, &my_rank);

    double *mpi_buffer = (double *)malloc(sizeof(double) * 1000000);
    MPI_Buffer_attach(mpi_buffer, sizeof(double) * 1000000);

    // 模拟开始
    start_time = clock();
    for (int i = 0; i < CYCLE; i++)
    {
        // 发送数据
        for (int j = 0; j < num_procs; j++)
            if (j != my_rank)
                MPI_Bsend((ball_list + my_rank * N / num_procs), sizeof(ball) * N / num_procs, MPI_BYTE, j, i * num_procs + my_rank, MPI_COMM_WORLD);
        // 接收数据
        for (int j = 0; j < num_procs; j++)
            if (j != my_rank)
            {
                MPI_Status status;
                MPI_Recv((ball_list + j * N / num_procs), sizeof(ball) * N / num_procs, MPI_BYTE, j, i * num_procs + j, MPI_COMM_WORLD, &status);
            }

        // 计算受力
        for (int j = (N / num_procs) * my_rank; j < (N / num_procs) * (my_rank + 1); j++)
            compute_force(j);
        MPI_Barrier(MPI_COMM_WORLD);
        // 计算速度位置
        for (int j = (N / num_procs) * my_rank; j < (N / num_procs) * (my_rank + 1); j++)
        {
            compute_velocities(j);
            compute_positions(j);
        }
        MPI_Barrier(MPI_COMM_WORLD);
    }
    end_time = clock();
    printf("rank %d time: %lf s\n", my_rank, (double)(end_time - start_time) / CLOCKS_PER_SEC);

    // 汇总结果
    if (my_rank != 0)
        MPI_Send((ball_list + my_rank * N / num_procs), sizeof(ball) * N / num_procs, MPI_BYTE, 0, my_rank, MPI_COMM_WORLD);
    else
    {
        FILE *fp = fopen("n body result.txt", "w");
        fprintf(fp, "//////////////////////////////\n//\n");
        fprintf(fp, "// Total  :\t%d\n// delta t:\t%lf\n// Cycles :\t%d\n", N, delta_t, CYCLE);
        fprintf(fp, "//\n//////////////////////////////\n\n");
        for (int i = 1; i < num_procs; i++)
        {
            MPI_Status status;
            MPI_Recv((ball_list + i * N / num_procs), sizeof(ball) * N / num_procs, MPI_BYTE, i, i, MPI_COMM_WORLD, &status);
        }
        for (int i = 0; i < N; i++)
            fprintf(fp, "%lf\t%lf\n", ball_list[i].pos_x, ball_list[i].pos_y);
        fprintf(fp, "\n");
        fclose(fp);
    }

    MPI_Finalize();
    return 0;
}
