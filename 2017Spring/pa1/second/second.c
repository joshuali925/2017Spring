#include<stdio.h>
#include<stdlib.h>
struct node {
    int num;
    struct node *next;
};
struct node *start = NULL;
int insert(struct node *ptr)
{
    struct node *head = start, *prev = start;

    if (head == NULL) {
        start = ptr;
        return 0;
    } else if (head->num > ptr->num) {
        ptr->next = start;
        start = ptr;
        return 0;
    }
    while (head != NULL) {
        if (head->num > ptr->num) {
            break;
        } else if (head->num == ptr->num) {
            return 0;
        } else {
            prev = head;
            head = head->next;
        }
    }
    head = prev;
    ptr->next = head->next;
    head->next = ptr;
    return 0;
}
int del(int n)
{
    struct node *head = start, *prev = start;

    if (head == NULL) {
        return 0;
    }
    if (head->num == n) {
        start = head->next;
        free(head);
        return 0;
    }
    while (head != NULL) {
        if (head->num == n) {
            prev->next = head->next;
            free(head);
            return 0;
        } else {
            prev = head;
            head = head->next;
        }
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
    struct node *temp;

    fp = fopen(filename, "r");
    if (fp == NULL) {
        printf("error");
        exit(0);
    }
    while (fscanf(fp, "%c %d\n", &ch, &num) != EOF) {
        temp = (struct node *)malloc(sizeof(struct node));
        if (ch == 'i') {
            temp->num = num;
            temp->next = NULL;
            insert(temp);
        } else if (ch == 'd') {
            del(num);
        }else{
			printf("error");
			exit(0);
        }
    }
    while (start != NULL) {
        printf("%d\t", start->num);
        start = start->next;
    }
    fclose(fp);
    return 0;
}
