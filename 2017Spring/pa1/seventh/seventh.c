#include<stdio.h>
#include<stdlib.h>
int main(int argc, char *argv[])
{
    if (argc < 2) {
        printf("error");
        exit(0);
    }
    int i, j;

    for (i = 1; i < argc; i++) {
        j = 0;
        while (argv[i][j] != '\0')
            j++;
        printf("%c", argv[i][j - 1]);
    }
    return 0;
}
