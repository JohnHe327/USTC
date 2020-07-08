#include <stdlib.h>
#include <stdio.h>
#include <tchar.h>
#include <omp.h>
#include <time.h>
#include <math.h>
#define NUM_THREADS 4
static long num_steps = 10000000;

int isPrime(int number)
{
    if (number <= 1)
        return 0;

    int sqrt_number = floor(sqrt(number));
    for (int i = 2; i <= sqrt_number; i++)
        if (number % i == 0)
            return 0;
    return 1;
}

int _tmain(int argc, _TCHAR* argv[])
{
    omp_set_num_threads(NUM_THREADS);
    int i, count = 0;
    clock_t tStart, tEnd;
    tStart = clock();
    #pragma omp parallel for reduction(+:count)
    for (i = 2; i <= num_steps; i++)
        count += isPrime(i);

    tEnd = clock();
    printf("total: %d\n", count);
    printf("time used: %lf s\n", (double)(tEnd - tStart) / CLOCKS_PER_SEC);
    return 0;
}
