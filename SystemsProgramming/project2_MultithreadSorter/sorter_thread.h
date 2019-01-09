#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <dirent.h>
#include <pthread.h>
char isnum(char *s);
void *processcsv(void *oripath);
void *traversedir(void *oripath);
char ***readdata(FILE * fp, int filecounter);
void *twowaymerge(void *context);
void kwaymerge();
void outputcolumn(char **column, int collen);
void outputfile();
void getcolinfo();


#include "mergesort.c"
void mergesort(char ***s, int low, int high, char type, int tosort);


