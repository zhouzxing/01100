#include <stdio.h>
#include <pthread.h>

unsigned long a = 0;
// 互斥锁
pthread_mutex_t mutex;

void* routine(void *arg)
{
	for(int i = 0; i < 1000000000; i++)
	{
		//pthread_mutex_lock(&mutex);
		int error = pthread_mutex_trylock(&mutex);
		if (!error)
		{
			a++;
			pthread_mutex_unlock(&mutex);
		}
	}
	//return NULL;
}

int main()
{
	pthread_t threads[2];
	pthread_mutex_init(&mutex, NULL);
	for(int i = 0; i < 2; i++)
	{
		pthread_create(&threads[i],NULL,routine,NULL);
	}
	for(int i = 0; i < 2; i++)
	{
		pthread_join(threads[i],NULL);
	}
	printf("%lu\n",a);
	return 0;
}
