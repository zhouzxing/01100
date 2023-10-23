#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/wait.h>
//#include <sys/types.h>
#include <unistd.h>
int main(int argc, char *argv[])
{
	int pipe_fd[2];
	int cpid;
	char buf;

	if (argc != 2)
	{
		fprintf(stderr,"Usages: %s <string>\n",argv[0]);
		exit(EXIT_FAILURE);
	}
	// create pipe: 0 read, 1 write
	if (pipe(pipe_fd) == -1)
	{
		perror("pipe");
		exit(EXIT_FAILURE);
	}
	close(pipe_fd[1]);
	cpid = fork();
	if (cpid == 0)
	{
		close(pipe_fd[1]);
		while((read(pipe_fd[0],&buf,1)) > 0)
		{
			write(STDOUT_FILENO,&buf,1);
		}
		write(STDOUT_FILENO,"\n",1);
		close(pipe_fd[0]);
		_exit(EXIT_SUCCESS);

	}	
	else
	{
		close(pipe_fd[0]);
		//write(pipe_fd[1],argv[1],strlen(argv[1]));
		close(pipe_fd[1]);
		wait(NULL);
		exit(EXIT_SUCCESS);
	}
}
