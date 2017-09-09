#include<stdio.h>
#include<stdlib.h>
struct node {
    int num;
    struct node *next;
};
struct node *table[10000];
int insert(int n);
int search(int n);
int insert(int n)
{
    if (search(n) == 1) {
        printf("duplicate\n");
        return 0;
    }
    struct node *temp = (struct node *)malloc(sizeof(struct node));

    temp->num = n;
    temp->next = table[abs(n % 10000)];
    table[abs(n % 10000)] = temp;
    printf("inserted\n");
    return 0;
}
int search(int n)
{
    struct node *temp = table[abs(n % 10000)];

    while (temp != NULL) {
        if (temp->num == n) {
            return 1;
        }
        temp = temp->next;
    }
    return 0;
}
int main(int argc, char **argv)
{

    if (argc < 2) {
        printf("no file name given\n");
        exit(0);
    }

    char *filename = argv[1];

    // char filename[] = "1.txt";  //alt



    FILE *fp;
    char ch;
    int num;

    fp = fopen(filename, "r");
    if (fp == NULL) {
        printf("error");
        exit(0);
    }
    while (fscanf(fp, "%c %d\n", &ch, &num) != EOF) {
        if (ch == 'i') {
            insert(num);
        } else if (ch == 's') {
            if (search(num) == 1) {
                printf("present\n");
            } else {
                printf("absent\n");
            }
        } else {
            printf("error\n");
        }
    }
    fclose(fp);
    return 0;
}
