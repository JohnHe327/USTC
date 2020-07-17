// Parallel sorting by regular sampling 排序算法
#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <limits.h>
#include <mpi.h>
#define NUM_ELEMENTS 1000000
int arr[NUM_ELEMENTS] = {0};

void Merge(int *arr, int left, int mid, int right)
{
    int n1 = mid - left + 1;
    int n2 = right - mid;
    int *L = (int *)malloc((n1 + 1) * sizeof(int));
    int *R = (int *)malloc((n2 + 1) * sizeof(int));
    int i, j, k;
    for (i = 0; i < n1; i++)
        L[i] = arr[left + i];
    for (j = 0; j < n2; j++)
        R[j] = arr[mid + 1 + j];
    L[i] = R[j] = INT_MAX;
    i = j = 0;
    for (k = left; k <= right; k++)
        if (L[i] <= R[j])
            arr[k] = L[i++];
        else
            arr[k] = R[j++];
    free(L);
    free(R);
}

void MergeSort(int *arr, int left, int right)
{
    if (left < right)
    {
        int mid = (left + right) / 2;
        MergeSort(arr, left, mid);
        MergeSort(arr, mid + 1, right);
        Merge(arr, left, mid, right);
    }
}

int main(int argc, char *argv[])
{
    clock_t start_time, end_time;
    int my_rank, num_procs;
    MPI_Init(&argc, &argv);
    MPI_Comm_size(MPI_COMM_WORLD, &num_procs);
    MPI_Comm_rank(MPI_COMM_WORLD, &my_rank);

    // 生成数据
    if (my_rank == 0)
    {
        srand((unsigned)time(NULL));
        FILE* fp = fopen("input.txt", "w");
        printf("input: input.txt");
        for (int i = 0; i < NUM_ELEMENTS; i++)
        {
            arr[i] = rand();
            fprintf(fp, "%d ", arr[i]);
        }
        fclose(fp);
        printf("\n");
    }
    MPI_Bcast(arr, NUM_ELEMENTS, MPI_INT, 0, MPI_COMM_WORLD);

    int *global_samples = (int *)malloc(num_procs * sizeof(int));
    int *global_sizes = (int *)malloc(num_procs * sizeof(int));
    int *global_offsets = (int *)malloc(num_procs * sizeof(int));

    int avg_elements = NUM_ELEMENTS / num_procs;
    int *samples = (int *)malloc(num_procs * sizeof(int)); // 采样数组
    int *pivots = (int *)malloc(num_procs * sizeof(int));  // num_processes - 1
    // 开始执行
    if (my_rank == 0) // 全局采样数组
    {
        global_samples = (int *)malloc(num_procs * num_procs * sizeof(int));
        start_time = clock();
    }

    // 各进程排序采样
    MergeSort(arr, my_rank * avg_elements, (my_rank + 1) * avg_elements - 1);
    for (int k = 0; k < num_procs; k++)
        samples[k] = arr[my_rank * avg_elements + k * avg_elements / num_procs];
    MPI_Gather(samples, num_procs, MPI_INT, global_samples, num_procs, MPI_INT, 0, MPI_COMM_WORLD);

    // 选择主元
    if (my_rank == 0)
    {
        MergeSort(global_samples, 0, num_procs * num_procs - 1);
        for (int k = 0; k < num_procs - 1; k++)
            pivots[k] = global_samples[(k + 1) * num_procs];
        pivots[num_procs - 1] = INT_MAX; //哨兵
    }
    MPI_Bcast(pivots, num_procs, MPI_INT, 0, MPI_COMM_WORLD);

    // 计算分段
    int *size = (int *)calloc(num_procs, sizeof(int));       // 划分后每段长度
    int *offset = (int *)calloc(num_procs, sizeof(int));     // 划分后起始位置
    int *new_size = (int *)calloc(num_procs, sizeof(int));   // 交换后每段长度
    int *new_offset = (int *)calloc(num_procs, sizeof(int)); // 交换后起始位置
    for (int k = 0, j = my_rank * avg_elements; j < (my_rank + 1) * avg_elements; j++)
    {
        while (arr[j] >= pivots[k])
            k++;
        size[k]++;
    }
    MPI_Alltoall(size, 1, MPI_INT, new_size, 1, MPI_INT, MPI_COMM_WORLD);
    // 交换段
    int new_data_size = new_size[0];
    for (int k = 1; k < num_procs; k++)
    {
        offset[k] = offset[k - 1] + size[k - 1];
        new_offset[k] = new_offset[k - 1] + new_size[k - 1];
        new_data_size += new_size[k];
    }
    int *new_data = (int *)malloc(new_data_size * sizeof(int));
    MPI_Alltoallv(&(arr[my_rank * avg_elements]), size, offset, MPI_INT, new_data, new_size, new_offset, MPI_INT, MPI_COMM_WORLD);
    // 排序
    MergeSort(new_data, 0, new_data_size - 1);

    // 汇总
    if (my_rank == 0)
        global_sizes = (int *)calloc(num_procs, sizeof(int));
    MPI_Gather(&new_data_size, 1, MPI_INT, global_sizes, 1, MPI_INT, 0, MPI_COMM_WORLD);
    if (my_rank == 0)
    {
        global_offsets = (int *)calloc(num_procs, sizeof(int));
        for (int k = 1; k < num_procs; k++)
            global_offsets[k] = global_offsets[k - 1] + global_sizes[k - 1];
    }
    MPI_Gatherv(new_data, new_data_size, MPI_INT, arr, global_sizes, global_offsets, MPI_INT, 0, MPI_COMM_WORLD);

    if (my_rank == 0)
    {
        end_time = clock();
        printf("\noutput: output.txt");
        FILE* fp = fopen("output.txt", "w");
        for (int i = 0; i < NUM_ELEMENTS; i++)
        {
            fprintf(fp, "%d ", arr[i]);
            if (i > 0 && arr[i - 1] > arr[i])
                printf("\nerror! arr[%d] = %d\n", i, arr[i]);
        }
        fclose(fp);
        printf("\n");
        printf("\ntime used: %lf s\n", (double)(end_time - start_time) / CLOCKS_PER_SEC);
    }

    free(samples);
    free(pivots);
    free(size);
    free(offset);
    free(new_data);
    free(new_size);
    free(new_offset);
    if (my_rank == 0)
    {
        free(global_samples);
        free(global_sizes);
        free(global_offsets);
    }
    MPI_Finalize();
    return 0;
}
