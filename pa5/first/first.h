#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<math.h>
void readFile(FILE * circFile, FILE * inputFile);
void process(FILE * circFile);
int not(char *p);
int and(char *p);
int or(char *p);
int decoder(char *p);
int multiplexer(char *p);
int grayToIndex(char *gray);
int toIndex(char c);
int getValue(char c);