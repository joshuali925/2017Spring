#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

void readDict(FILE * dict_file);
void readData(FILE * data_file);
void matchStr(char *str);
void printResult();
void insertDict(char *s);
struct node *child(char *s, int i);
void print(struct node *ptr, char *s,int size, FILE * out);
void freeTrie(struct node *temp);
void prefixInc(struct node *ptr, int n);
void traverse(struct node *ptr);