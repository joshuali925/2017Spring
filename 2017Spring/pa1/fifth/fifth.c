#include<stdio.h>
#include<stdlib.h>
int main(int argc, char **argv)
{
    if (argc < 2) {
        printf("no file name given\n");
        exit(0);
    }
    char *filename = argv[1];

    // char filename[] = "1";  //alt
    FILE *fp;

    fp = fopen(filename, "r");
    if (fp == NULL) {
        printf("error");
        exit(0);
    }
    int i, j, k, l, a, b, c, temp = 0;

    fscanf(fp, "%d%d", &i, &j);
    int mat1[i][j];

    for (a = 0; a < i; a++)
        for (b = 0; b < j; b++)
            fscanf(fp, "%d", &mat1[a][b]);
    fscanf(fp, "%d%d", &k, &l);
    if (j != k) {
        exit(0);
    }
    int mat2[k][l], prod[i][l];

    for (a = 0; a < k; a++)
        for (b = 0; b < l; b++)
            fscanf(fp, "%d", &mat2[a][b]);
    for (c = 0; c < i; c++) {
        for (a = 0; a < l; a++) {
            for (b = 0; b < k; b++)
                temp += mat1[c][b] * mat2[b][a];
            prod[c][a] = temp;
            temp = 0;
        }
    }
    for (a = 0; a < i; a++) {
        for (b = 0; b < l; b++)
            printf("%d\t", prod[a][b]);
        printf("\n");
    }
    fclose(fp);
    return 0;
}
