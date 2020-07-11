// 使用MPI对Nagel-Schreckenberg道路模型进行蒙特卡洛模拟

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <mpi.h>
#define TEST 0

const int num_car[3] = {100000, 500000, 1000000};
const int num_cycle[3] = {2000, 500, 300};
const int init_v = 0, init_dis = 1;
const int v_max = 10, prob = 5;

typedef struct car
{
    int velocity;
    int distance;
    int position;
} car;
car car_list[1000000];

int v_count[v_max + 1] = {0}; // 车速统计
int pos_count[1000 + v_max * 2] = {0}; // 每公里内车辆数

int main(int argc, char *argv[])
{
    // init
    for (int i = 0; i < num_car[TEST]; i++)
    {
        car_list[i].velocity = init_v;
        car_list[i].distance = init_dis;
        car_list[i].position = init_dis * i;
    }
    car_list[num_car[TEST] - 1].distance = v_max + 1;

    int my_rank, num_procs;
    clock_t start_time, end_time;

    MPI_Init(&argc, &argv);
    MPI_Comm_rank(MPI_COMM_WORLD, &my_rank);
    MPI_Comm_size(MPI_COMM_WORLD, &num_procs);

    int *mpi_buffer = (int *)malloc(sizeof(int) * num_car[TEST]);
    MPI_Buffer_attach(mpi_buffer, sizeof(int) * num_car[TEST]);

    // start
    start_time = clock();
    for (int j = 0; j < num_cycle[TEST]; j++)
    {
        int i = (num_car[TEST] / num_procs * my_rank); // 指向这个集合的第一个元素（队尾）
        // 向前一个进程发送队尾数据
        if (my_rank != 0)
            MPI_Bsend(&(car_list[i].position), 1, MPI_INT, my_rank - 1, j * num_procs + my_rank, MPI_COMM_WORLD);

        // 更新除队头的车
        for (; i < num_car[TEST] / num_procs * (my_rank + 1) - 1; i++)
        {
            // 更新距离
            car_list[i].distance = car_list[i + 1].position - car_list[i].position;
            // 更新速度
            if (car_list[i].velocity < v_max)
                car_list[i].velocity++;
            if (car_list[i].velocity >= car_list[i].distance)
                car_list[i].velocity = car_list[i].distance - 1;
            // srand(i * num_car[TEST] + j);
            if (car_list[i].velocity > 0 && rand() % 10 < prob)
                car_list[i].velocity--;
            // 更新位置
            car_list[i].position += car_list[i].velocity;
        }

        // 队头
        if (my_rank != num_procs - 1)
        {
            int temp;
            MPI_Status status;
            MPI_Recv(&(temp), 1, MPI_INT, my_rank + 1, j * num_procs + my_rank + 1, MPI_COMM_WORLD, &status);
            // 更新距离
            car_list[i].distance = temp - car_list[i].position;
        }
        // 更新速度
        if (car_list[i].velocity < v_max)
            car_list[i].velocity++;
        if (car_list[i].velocity >= car_list[i].distance)
            car_list[i].velocity = car_list[i].distance - 1;
        srand((unsigned)time(NULL));
        if (car_list[i].velocity > 0 && rand() % 10 < prob)
            car_list[i].velocity--;
        // 更新位置
        car_list[i].position += car_list[i].velocity;
    }
    end_time = clock();
    printf("rank %d time: %lf\n", my_rank, (double)(end_time - start_time) / CLOCKS_PER_SEC);

    // 写结果
    MPI_Barrier(MPI_COMM_WORLD);
    if (my_rank != num_procs - 1)
        MPI_Send((car_list + my_rank * num_car[TEST] / num_procs), sizeof(car) * num_car[TEST] / num_procs, MPI_BYTE, num_procs - 1, my_rank, MPI_COMM_WORLD);
    else
    {
        MPI_Status status;
        for (int i = 0; i < my_rank; i++)
            MPI_Recv((car_list + i * num_car[TEST] / num_procs), sizeof(car) * num_car[TEST] / num_procs, MPI_BYTE, i, i, MPI_COMM_WORLD, &status);

        FILE *fp = fopen("car ststus.txt", "w");
        FILE *fp2 = fopen("velocity&position count.txt", "w");

        // car status
        fprintf(fp, "car\tv\tpos\tdistance\n");
        for (int i = 0; i < num_car[TEST]; i++)
            fprintf(fp, "%d\t%d\t%d\t%d\n", i, car_list[i].velocity, car_list[i].position, car_list[i].distance);

        for (int i = 0; i < num_car[TEST]; i++)
        {
            v_count[car_list[i].velocity]++;
            pos_count[car_list[i].position / 1000]++;
        }

        fprintf(fp2, "volicity count\n");
        for (int k = 0; k <= v_max; k++)
            fprintf(fp2, "%d\t%d\n", k, v_count[k]);

        fprintf(fp2, "\nposition count\n");
        int max_position = (num_car[TEST] * init_dis + v_max * num_cycle[TEST]) / 1000;
        for (int k = 0; k <= max_position; k++)
            fprintf(fp2, "%d\t%d\n", k, pos_count[k]);
        fclose(fp);
        fclose(fp2);
    }

    MPI_Barrier(MPI_COMM_WORLD);
    MPI_Finalize();
    return 0;
}
