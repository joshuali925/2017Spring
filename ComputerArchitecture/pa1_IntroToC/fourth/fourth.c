#include<stdio.h>
#include<stdlib.h>
int main(int argc, char **argv)
{
    if (argc < 2) {
        printf("no file name given\n");
        exit(0);
    }
    char *filename = argv[1];

    // char filename[] = "1.txt";  //alt
    FILE *fp;

    fp = fopen(filename, "r");
    if (fp == NULL) {
        printf("error");
        exit(0);
    }
    int i, j, a, b;

    fscanf(fp, "%d%d", &i, &j);
    int mat1[i][j], mat2[i][j];

    for (a = 0; a < i; a++) {
        for (b = 0; b < j; b++) {
            fscanf(fp, "%d", &mat1[a][b]);
        }
    }
    for (a = 0; a < i; a++) {
        for (b = 0; b < j; b++) {
            fscanf(fp, "%d", &mat2[a][b]);
            mat2[a][b] += mat1[a][b];
        }
    }
    for (a = 0; a < i; a++) {
        for (b = 0; b < j; b++) {
            printf("%d\t", mat2[a][b]);
        }
        printf("\n");
    }

    fclose(fp);
    return 0;
}
