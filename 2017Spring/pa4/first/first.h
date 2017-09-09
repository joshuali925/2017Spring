#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<math.h>
typedef struct cache cache;
void readFile(FILE * fp);
void readCache(cache * lookfor, cache * table[], char type, char instr);
cache *createBlock(char *address, char type);
char *hexToBinary(char *hex);
void freeTable(cache * table[]);
