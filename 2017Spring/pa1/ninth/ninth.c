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
            return h;
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
int delete(int n)
{
    struct node *ptr = root, *prev = NULL, *temp, *tempParent;

    while (ptr != NULL) {
        if (ptr->num == n) {
            break;
        } else if (ptr->num > n) {
            prev = ptr;
            ptr = ptr->left;
        } else {
            prev = ptr;
            ptr = ptr->right;
        }
    }                           //locate
    if (ptr == NULL) {
        printf("fail\n");
        return 0;
    }
    temp = ptr;                 //to be deleted
    tempParent = prev;          //parent
    if (temp->left != NULL && temp->right != NULL) {    //2 children
        prev = ptr;
        ptr = ptr->right;
        while (ptr->left != NULL) {
            prev = ptr;
            ptr = ptr->left;
        }
        ptr->left = temp->left;
        if (ptr->num == temp->right->num) {     // bug fix
            ptr->right = temp->right->right;
        } else {
            prev->left = ptr->right;
            ptr->right = temp->right;
        }
        if (tempParent == NULL) {       //deleting root
            root = ptr;
        } else if (tempParent->num < temp->num) {
            tempParent->right = ptr;
        } else {
            tempParent->left = ptr;
        }
    } else if (temp->left != NULL) {    //only left children
        if (tempParent == NULL) {
            root = temp->left;
        } else if (tempParent->num < temp->num) {
            tempParent->right = temp->left;
        } else {
            tempParent->left = temp->left;
        }
    } else if (temp->right != NULL) {   //only right children
        if (tempParent == NULL) {
            root = temp->right;
        } else if (tempParent->num < temp->num) {
            tempParent->right = temp->right;
        } else {
            tempParent->left = temp->right;
        }
    } else {                    //no children
        if (tempParent == NULL) {
            root = NULL;
        } else if (tempParent->num < temp->num) {
            tempParent->right = NULL;
        } else {
            tempParent->left = NULL;
        }
    }
    printf("success\n");
    free(temp);
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
        } else if (ch == 'd') {
            delete(num);
        } else {
            printf("error");
            exit(0);
        }
    }
    fclose(fp);
    freeMemory(root);
    return 0;
}
