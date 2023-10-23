#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int g_value;
int main(int argc, char**argv)
{
	// strtol系统函数
	g_value = strtol(argv[1],NULL,10);
	pid_t pid = getpid();
	while(1)
	{
		printf("%d: the address:%p\n",pid, &pid);
		printf("%d: the values:%d\n",pid, g_value);
	}

	return 0;
}
