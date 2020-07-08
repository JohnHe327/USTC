#include <stdio.h>
#include <mpi.h>
static long num_steps = 100000;

int main(int argc, char *argv[])
{
    int my_rank, num_procs;
    int i;
    double sum, step, local, my_pi, pi;
    double start_time = 0.0, stop_time = 0.0;

    // initialize
    MPI_Init(&argc, &argv);
    MPI_Comm_rank(MPI_COMM_WORLD, &my_rank);
    MPI_Comm_size(MPI_COMM_WORLD, &num_procs);

    // calculate
    if (my_rank == 0)
        start_time = MPI_Wtime();
    sum = 0.0;
    step = 1.0 / num_steps;

    for (i = my_rank; i < num_steps; i += num_procs)
    {
        local = step * ((double)i + 0.5);
        sum += 4.0 / (1.0 + local * local);
    }
    my_pi = step * sum;
    MPI_Reduce(&my_pi, &pi, 1, MPI_DOUBLE, MPI_SUM, 0, MPI_COMM_WORLD);

    // result
    if (my_rank == 0)
    {
        stop_time = MPI_Wtime();
        printf("pi = %lf\n", pi);
        printf("time used: %lf s\n", stop_time - start_time);
        fflush(stdout);
    }
    MPI_Finalize();
    return 0;
}
