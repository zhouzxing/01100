#define _GNU_SOURCE
#include <sched.h>
#include <numa.h>
#include <stdio.h>

int main()
{
	int cpu = sched_getcpu();
	int node = numa_node_of_cpu(cpu);

	int *mem0 = numa_alloc_onnode(sizeof(int), node);
	int *mem1 = numa_alloc_local(sizeof(int));
	int *mem2 = numa_alloc_interleaved(sizeof(int));

	*mem0 = *mem1 = *mem2 = 0;

	numa_free(mem1,sizeof(int));
	numa_free(mem2,sizeof(int));
	numa_free(mem0,sizeof(int));

	return 0;
}
