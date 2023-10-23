#include <sched.h>
#include <sys/sysinfo.h>
int main()
{
	cpu_set_t mask;
	CPU_ZERO(&mask);

	//
	CPU_SET(0, &mask);
	CPU_SET(1, &mask);

	//
	sched_setaffinity(0, sizeof(mask), &mask);

	return 0;
}
