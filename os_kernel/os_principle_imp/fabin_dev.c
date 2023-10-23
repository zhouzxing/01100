#include <signal.h>
#include <stdio.h>
#include <ucontext.h>
//#include <unistd.h>

ucontext_t ucontext1,ucontext2;
int current;
void produce()
{
	current++;
	setcontext(&ucontext2);
}

void consume()
{
	printf("consume:%d\n",current);
	setcontext(&ucontext1);
}

int main()
{
	// init fabin process
	char stack1[SIGSTKSZ];
	char stack2[SIGSTKSZ];

	getcontext(&ucontext1);
	ucontext1.uc_link = NULL;
	ucontext1.uc_stack.ss_sp = stack1;
	ucontext1.uc_stack.ss_size = sizeof(stack1);
	makecontext(&ucontext1, (void (*)())produce,0);

	getcontext(&ucontext2);
	ucontext2.uc_link = NULL;
	ucontext2.uc_stack.ss_sp = stack1;
	ucontext2.uc_stack.ss_size = sizeof(stack1);
	makecontext(&ucontext2, (void (*)())consume,0);

	// 启动生产者
	setcontext(&ucontext1);

	return 0;
}
