#include "second.h"
const char delimit[] =
    " \t\r\n\v\f!\"#$%&'()*++,-./0123456789:;<=>?@[\\]^_`{|}~©®";
int indexNumber = 1;
struct node *root;
struct node {
    char ch;
    int occu, prefixes, prefixBuff;     //-1 if not a word
    struct node *child, *next;
};
void insertDict(char *s)
{
    struct node *ptr = root, *temp, *prev;
    int i = 0;

    if (!ptr->next) {           //if no elements
        ptr->next = child(s, 0);
        return;
    }
    prev = ptr;
    ptr = ptr->next;
    while (s[i]) {
        while (ptr->next && ptr->ch < s[i]) {   //horizontal search
            prev = ptr;
            ptr = ptr->next;
        }
        if (ptr->ch != s[i]) {  // didn't find
            if (!ptr->next) {   // reached horizontal end
                if (ptr->ch > s[i]) {   //add to prev
                    temp = child(s, i);
                    temp->next = ptr;
                    if (prev->child == ptr) {   //first child
                        prev->child = temp;
                    } else {    //add to next, link next->next
                        prev->next = temp;
                    }
                } else {        //add to next
                    ptr->next = child(s, i);
                }
            } else {            //insert at position
                temp = child(s, i);
                temp->next = ptr;
                if (prev->child == ptr) {
                    prev->child = temp;
                } else {
                    prev->next = temp;
                }
            }
            return;
        }
        if (s[i + 1]) {         //did not reach the end of word
            if (ptr->child) {   //has child, go to child
                prev = ptr;
                ptr = ptr->child;
                i++;
            } else {            //append as child
                ptr->child = child(s, i + 1);
            }
        } else {
            break;
        }
    }
    ptr->occu = 0;              //appending shorter word
    return;
}

void readDict(FILE * dict_file)
{
    char line[1024], *words, *p;

    while (fgets(line, sizeof(line), dict_file)) {
        words = strtok(line, delimit);
        while (words != NULL) {
            p = words;
            for (; *p; p++)
                *p = tolower(*p);
            insertDict(words);
            words = strtok(NULL, delimit);
        }
    }
    fclose(dict_file);
}

void readData(FILE * data_file)
{
    char line[1024], *words, *p;

    while (fgets(line, sizeof(line), data_file)) {
        words = strtok(line, delimit);
        while (words != NULL) {
            p = words;
            for (; *p; p++)
                *p = tolower(*p);
            matchStr(words);
            words = strtok(NULL, delimit);
        }
    }
    fclose(data_file);
    traverse(root);
}
void matchStr(char *str)
{
    if (!root->next)
        return;
    struct node *ptr = root->next;
    int i = 0;

    while (str[i]) {
        while (ptr->next && ptr->ch != str[i]) {        //horizontal search
            ptr = ptr->next;
        }
        if (ptr->ch != str[i]) {
            return;
        }
        if (str[i + 1]) {       //did not reach the end of word
            if (ptr->child) {   //has child, go to child
                ptr = ptr->child;
                i++;
            } else {
                return;
            }
        } else {
            if (ptr->occu > -1) //found a word
                ptr->occu++;
            if (ptr->child) {   //has child, increment all prefixes
                //prefixInc(ptr->child);
                ptr->child->prefixBuff++;
            }
            return;
        }
    }
}
void prefixInc(struct node *ptr, int n) //increase prefixes by n for ptr and all words under ptr
{
    if (ptr->occu > -1) {
        ptr->prefixes += n;
    }
    if (ptr->child) {
        prefixInc(ptr->child, n);
    }
    if (ptr->next) {
        prefixInc(ptr->next, n);
    }
}
void traverse(struct node *ptr) //traverse through all nodes, increment prefix by buffer
{
    if (ptr->child) {
        if (ptr->child->prefixBuff > 0)
            prefixInc(ptr->child, ptr->child->prefixBuff);
        traverse(ptr->child);
    }
    if (ptr->next) {
        if (ptr->next->prefixBuff > 0)
            prefixInc(ptr->next, ptr->next->prefixBuff);
        traverse(ptr->next);
    }
}
void printResult()
{
    if (!root->next)
        return;
    struct node *ptr = root->next;
    char s[2], filename[12];

    s[0] = ptr->ch;
    s[1] = '\0';
    sprintf(filename, "out%d.txt", indexNumber);
    FILE *out = fopen(filename, "w");   // overwrite previous file

    fclose(out);
    out = fopen(filename, "a");
    print(ptr, s, 2, out);
    fclose(out);
}
void print(struct node *ptr, char s[], int size, FILE * out)
{
    char temp[size + 1];

    if (ptr->occu > -1) {
        if (size == 2) {
            fprintf(out, "%c %d %d\n", ptr->ch, ptr->occu, ptr->prefixes);
        } else {
            fprintf(out, "%s%c %d %d\n", s, ptr->ch, ptr->occu,
                    ptr->prefixes);
        }
    }
    strcpy(temp, s);
    temp[size - 1] = '\0';
    temp[size - 2] = ptr->ch;
    if (ptr->child) {
        print(ptr->child, temp, size + 1, out);
    }
    if (ptr->next) {
        print(ptr->next, s, size, out);
    }
}
struct node *child(char *s, int i)      // construct a child node with s[] starting at i
{
    struct node *temp, *prev = NULL, *hold;

    for (; s[i]; i++) {
        temp = (struct node *)malloc(sizeof(struct node));
        temp->ch = s[i];
        temp->occu = s[i + 1] ? -1 : 0;
        temp->prefixes = 0;
        temp->prefixBuff = 0;
        temp->next = NULL;
        if (prev)
            prev->child = temp;
        else
            hold = temp;
        prev = temp;
    }
    temp->child = NULL;
    return hold;
}
void freeTrie(struct node *temp)
{
    if (!temp)
        return;
    if (temp->next)
        freeTrie(temp->next);
    if (temp->child)
        freeTrie(temp->child);
    if (!temp->child && !temp->next)
        free(temp);
}
int main(int argc, char **argv)
{
    if (argc != 2) {
        printf("invalid input");
        exit(0);
    }
    FILE *fp = fopen(argv[1], "r");

    if (fp == NULL) {
        printf("invalid input");
        exit(0);
    }
    // FILE *fp = fopen("map", "r");
    char dict[80], data[80];

    while (fscanf(fp, "%s %s ", dict, data) != EOF) {
        struct node *temp = (struct node *)malloc(sizeof(struct node));

        temp->ch = '0';
        temp->occu = -1;
        temp->prefixes = 0;
        temp->prefixBuff = 0;
        temp->next = NULL;
        temp->child = NULL;
        root = temp;
        readDict(fopen(dict, "r"));
        readData(fopen(data, "r"));
        printResult();
        freeTrie(root);
        indexNumber++;
    }
    fclose(fp);
    return 0;
}
