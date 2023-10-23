#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>

int main()
{
	/*
	 int x = 0;
	int ret = fork();
	if (ret == 0)
	{
		printf("child x value:%d address:%p\n",x,&x);
	}
	else
		printf("parent x value:%d address:%p\n",x,&x);
	*/
	int num = 2,total = 0,pid=getpid();
	//printf("pid : %d",pid);
	for (int x = 0; x < num; x++) 
	{
	//	total += fork() ? 1 : 0;
		x += fork() ? 1 : 0;
	}
	//printf("pid : %d hello: %d\n",pid,total);
	printf("hello\n");
	return 0;
}
