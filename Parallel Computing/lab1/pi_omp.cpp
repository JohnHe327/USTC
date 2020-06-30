#include "stdlib.h"
#include <stdio.h>
#include <tchar.h>
#include <omp.h>
#include <time.h>
#define NUM_THREADS 2
static long num_steps = 100000;
double step;

int _tmain(int argc, _TCHAR* argv[])
{
	int i;
	double x, pi, sum = 0.0;
	step = 1.0 / (double)num_steps;
	time_t tStart, tEnd;
	tStart = clock();
	omp_set_num_threads(NUM_THREADS);
	#pragma omp parallel for reduction(+:sum) private(x)
	for (i = 0; i < num_steps; i++)
	{
		x = (i + 0.5) * step;
		sum += 4.0 / (1.0 + x * x);
	}
	pi = step * sum;
	tEnd = clock();

	printf("pi = %f\n", pi);
	printf("time used: %lf s\n", (double)(tEnd - tStart) / CLOCKS_PER_SEC);
	return 0;
}
