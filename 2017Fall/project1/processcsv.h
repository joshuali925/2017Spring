#include <stdio.h>
#include <stdlib.h>
#include <string.h>
char isnum(char *s);
void readdata();
int searchcol(char *coltosort);
int processcsv(char *filename, char *coltosortstr, char *outname);


#include "mergesort.c"
void mergesort(char ***s, int low, int high, char *type, int *tosort, int l);
