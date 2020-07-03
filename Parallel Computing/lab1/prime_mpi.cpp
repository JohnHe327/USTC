#include <stdio.h>
#include <math.h>
#include <mpi.h>

int isPrime(int number)
{
    if (number <= 1)
        return 0;

    int sqrt_number = floor(sqrt(number));
    for (int j = 2; j <= sqrt_number; j++)
        if (number % j == 0)
            return 0;
    return 1;
}

int main(int argc, char* argv[])
{
    int num_steps, my_rank, num_procs, i, total, local_sum;
    double start_time, end_time;

    MPI_Init(&argc, &argv);
    MPI_Comm_size(MPI_COMM_WORLD, &num_procs);
    MPI_Comm_rank(MPI_COMM_WORLD, &my_rank);

    if (my_rank == 0)
    {
        printf("max number：");
        fflush(stdout);
        scanf("%d", &num_steps);
        start_time = MPI_Wtime();
    }
    MPI_Bcast(&num_steps, 1, MPI_INT, 0, MPI_COMM_WORLD);

    local_sum = 0;
    int sun = num_steps / num_procs;
    for (i = my_rank; i <= num_steps; i += num_procs)
        local_sum += isPrime(i);
    MPI_Reduce(&local_sum, &total, 1, MPI_INT, MPI_SUM, 0, MPI_COMM_WORLD);

    if (my_rank == 0)
    {
        printf("total: %d\n", total);
        end_time = MPI_Wtime();
        printf("time used: %lf s\n", end_time - start_time);
    }
    MPI_Finalize();
    return 0;
}
