#include<stdio.h>
#include<stdlib.h>

int main(int argc, char* argv[]){
	if(argc < 2){
		printf("error\n");
		exit(0);
	}
	int i, j = 0, n = atoi(argv[1]);
	if(n == 1){
		printf("no\n");
		exit(0);
	}
	for(i = 2; i <= n/2; i++)
		if(n % i == 0)
			j = 1;
	if(j == 1)
		printf("no\n");
	else
		printf("yes\n");
	return 0;
}
