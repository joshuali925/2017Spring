#include <stdio.h>
#include <stdlib.h>
#include <string.h>
char isnum(char *s);
void *processcsv(void *oripath);
void *multisort(void *oripath);
void appenddir(char *npath, char *path, char *path2);
char ***readdata(FILE * fp, int collen, int filecounter, int maxlen);
int twowaymerge(char ****table, int file1, int file2, int linelen[], int type, int tosort);
char ***kwaymerge(char ****table, int filenum, int linelen[], int type, int tosort);
void outputcolumn(char **column, int collen);


#include "mergesort.c"
void mergesort(char ***s, int low, int high, char type, int tosort);
