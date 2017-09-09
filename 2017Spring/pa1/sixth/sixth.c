#include<stdio.h>
#include<stdlib.h>
int main(int argc, char *argv[])
{
    if (argc < 2) {
        printf("error");
        exit(0);
    }
    int i;

    for (i = 1; i < argc; i++) 
        printf("%c", argv[i][0]);
    return 0;
}
