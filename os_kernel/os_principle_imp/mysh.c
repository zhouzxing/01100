#include <stdio.h>
#include <spawn.h>
#include <sys/wait.h>
#include <stdlib.h>
#include <string.h>
#define MAX_LINE 1000

void eval(char* cmd);

int main()
{
	char cmd_line[MAX_LINE];
	while (1) 
	{
		printf("mysh> ");
		fflush(stdout);

		// 读取命令行指令，创建子进程，执行指令
		fgets(cmd_line, MAX_LINE,stdin);
		// 处理输入指令字符串格式
		cmd_line[strcspn(cmd_line,"\n")] = '\0';

		eval(cmd_line);
	}

	return 0;	
}	

void eval(char* cmd)
{
	// 创建进程 - API不熟悉
	if (strcmp(cmd, "quit")==0)
	{
		exit(0);
	}
	pid_t pid;
	char* argv[2] = {cmd, NULL};
	posix_spawn(&pid, cmd, NULL, NULL, argv, NULL);
	int exit_status;
	waitpid(pid, &exit_status, 0);

}

