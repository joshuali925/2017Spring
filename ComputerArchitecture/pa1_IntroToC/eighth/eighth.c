#include<stdio.h>
#include<stdlib.h>
struct node {
    int num;
    struct node *left, *right;
};
struct node *root = NULL;
int insert(int n)
{
    struct node *temp = (struct node *)malloc(sizeof(struct node));
    int h = 1;

    temp->num = n;
    temp->left = NULL;
    temp->right = NULL;
    if (root == NULL) {
        root = temp;
        printf("inserted %d\n", h);
        return 0;
    }
    struct node *ptr = root, *prev = NULL;

    while (ptr != NULL) {
        h++;
        if (ptr->num == n) {
            printf("duplicate\n");
            return 0;
        } else if (ptr->num > n) {
            prev = ptr;
            ptr = ptr->left;
        } else {
            prev = ptr;
            ptr = ptr->right;
        }
    }
    if (prev->num > n) {
        prev->left = temp;
    } else {
        prev->right = temp;
    }
    printf("inserted %d\n", h);
    return 0;
}
int search(int n)
{
    struct node *temp = root;
    int h = 1;

    while (temp != NULL) {
        if (temp->num == n) {
            printf("present %d\n", h);
            return 1;
        } else if (temp->num > n) {
            temp = temp->left;
        } else {
            temp = temp->right;
        }
        h++;
    }
    printf("absent\n");
    return 0;
}
int freeMemory(struct node *temp)
{
    if (temp == NULL)
        return 0;
    freeMemory(temp->left);
    freeMemory(temp->right);
    free(temp);
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
            search(num);
        } else {
            printf("error");
            exit(0);
        }
    }
    fclose(fp);
    freeMemory(root);
    return 0;
}
