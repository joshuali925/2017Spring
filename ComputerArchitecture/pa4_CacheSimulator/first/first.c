#include"first.h"
//========================================================================//
struct cache {
    int indexValue, offsetValue;
    char *tag;
    cache *next;
};
int cacheSize, sets, blockSize, associativity, tagBits,
    indexBits,
    offsetBits, readsA = 0, readsB = 0, reads = 0, writes = 0,
    hitsA = 0, missesA = 0, hitsB = 0, missesB = 0;
//========================================================================//
void readFile(FILE * fp)
{
    char instr, pc[20], address[20];
    int i;
    cache *tableA[sets], *tableB[sets], *ptr;

    for (i = 0; i < sets; i++) {
        tableA[i] = NULL;
        tableB[i] = NULL;
    }
    while (fscanf(fp, "%s %c %s ", pc, &instr, address) != EOF) {
        if (strcmp(pc, "#eof") == 0)
            return;
        instr == 'R' ? reads++ : writes++;
        ptr = createBlock(hexToBinary(address), 'A');
        readCache(ptr, tableA, 'A', instr);
        ptr = createBlock(hexToBinary(address), 'B');
        readCache(ptr, tableB, 'B', instr);
    }
    freeTable(tableA);
    freeTable(tableB);
    fclose(fp);
}
void readCache(cache * lookfor, cache * table[], char type, char instr)
{
    cache *ptr = table[lookfor->indexValue], *prev = NULL;
    int traverse = 0;

    //========================================================================//
    // printf("tag=%s  \tindex=%d  \toffset=%d\n", lookfor->tag,
    // lookfor->indexValue, lookfor->offsetValue);
    // printf("looking in [%d]\n", lookfor->indexValue);
    // printf("looking for %s   %d   %d\n", lookfor->tag, lookfor->indexValue,
    // lookfor->offsetValue);
    // while (ptr) {
    // printf("has           %s   %d   %d\n", ptr->tag, ptr->indexValue,
    // ptr->offsetValue);
    // ptr = ptr->next;
    // }
    // ptr = table[lookfor->indexValue];
    //========================================================================//
    while (ptr) {
        if (strcmp(ptr->tag, lookfor->tag) == 0) {
            // && lookfor->offsetValue >= ptr->offsetValue
            // && lookfor->offsetValue < ptr->offsetValue + blockSize) {
            type == 'A' ? hitsA++ : hitsB++;
            // printf("hit\n\n");
            free(lookfor);
            return;
        }
        if (++traverse == associativity) {      //check if out of bounds
            free(ptr);
            if (prev)
                prev->next = NULL;
            else
                table[lookfor->indexValue] = NULL;
            break;
        }
        prev = ptr;
        ptr = ptr->next;
    }
    // printf("miss\n\n");
    type == 'A' ? missesA++ : missesB++;
    type == 'A' ? readsA++ : readsB++;
    lookfor->next = table[lookfor->indexValue];
    table[lookfor->indexValue] = lookfor;
}
cache *createBlock(char *address, char type)
{
    cache *temp = (cache *) malloc(sizeof(cache));
    temp->tag = (char *)malloc(sizeof(char) * tagBits + 1);
    char *index = (char *)malloc(sizeof(char) * indexBits + 1);
    char *offset = (char *)malloc(sizeof(char) * offsetBits + 1);

    if (type == 'A') {
        memcpy(temp->tag, address, tagBits);
        *(temp->tag + tagBits) = '\0';  //set tag
        memcpy(index, address + tagBits, indexBits);
        *(index + indexBits) = '\0';    //set index
    } else {
        memcpy(index, address, indexBits);
        *(index + indexBits) = '\0';    //set index
        memcpy(temp->tag, address + indexBits, tagBits);
        *(temp->tag + tagBits) = '\0';  //set tag
    }
    memcpy(offset, address + tagBits + indexBits, offsetBits);
    *(offset + offsetBits) = '\0';      //set offset
    temp->indexValue = (int)strtol(index, NULL, 2);     //convert to decimal
    temp->offsetValue = (int)strtol(offset, NULL, 2);   //convert to decimal
    temp->next = NULL;
    free(index);
    free(offset);
    return temp;
}
int main(int argc, char **argv)
{
    if (argc != 5) {
        printf("invalid number of arguments");
        return 0;
    }
    cacheSize = atoi(argv[1]);
    blockSize = atoi(argv[3]);
    if ((cacheSize & ~(cacheSize - 1)) != cacheSize
        || (blockSize & ~(blockSize - 1)) != blockSize) {
        printf("invalid size");
        return 0;
    }
    if (strcmp(argv[2], "direct") == 0) {
        sets = cacheSize / blockSize;
    } else if (strcmp(argv[2], "assoc") == 0) {
        sets = 1;
    } else if (strncmp("assoc:", argv[2], 6) == 0) {
        sets = cacheSize / (blockSize * atoi(argv[2] + 6));
    } else {
        printf("invalid associativity\n");
        return 0;
    }
    FILE *fp = fopen(argv[4], "r");

    if (!fp) {
        printf("can't open file");
        return 0;
    }
    // cacheSize = 512;
    // blockSize = 16;
    // sets = 32;
    // FILE *fp = fopen("trace2.txt", "r");

    //========================================================================//
    associativity = cacheSize / (blockSize * sets);
    indexBits = ceil(log(sets) / log(2));
    offsetBits = ceil(log(blockSize) / log(2));
    tagBits = 48 - indexBits - offsetBits;
    //========================================================================//
    // printf
    // ("sets:%d  associativity:%d  blockSize:%d  indexBits:%d  offsetBits:%d\n",
    // sets, associativity, blockSize, indexBits, offsetBits);
    readFile(fp);
    printf
        ("cache A\nMemory reads: %d\nMemory writes: %d\nCache hits: %d\nCache misses: %d\n",
         readsA, writes, hitsA, readsA);
    printf
        ("cache B\nMemory reads: %d\nMemory writes: %d\nCache hits: %d\nCache misses: %d\n",
         readsB, writes, hitsB, readsB);
    // printf("total R=%d  total W=%d\n", reads, writes);
    return 0;
}
char *hexToBinary(char *hex)
{
    char *binary = (char *)malloc(sizeof(char) * (49));
    int i;

    *binary = '\0';
    for (i = strlen(hex); i < 14; i++)  //0x(12bytes)
        strcat(binary, "0000");
    for (i = 2; i < strlen(hex); i++) {
        switch (hex[i]) {
        case '0':
            strcat(binary, "0000");
            break;
        case '1':
            strcat(binary, "0001");
            break;
        case '2':
            strcat(binary, "0010");
            break;
        case '3':
            strcat(binary, "0011");
            break;
        case '4':
            strcat(binary, "0100");
            break;
        case '5':
            strcat(binary, "0101");
            break;
        case '6':
            strcat(binary, "0110");
            break;
        case '7':
            strcat(binary, "0111");
            break;
        case '8':
            strcat(binary, "1000");
            break;
        case '9':
            strcat(binary, "1001");
            break;
        case 'a':
            strcat(binary, "1010");
            break;
        case 'b':
            strcat(binary, "1011");
            break;
        case 'c':
            strcat(binary, "1100");
            break;
        case 'd':
            strcat(binary, "1101");
            break;
        case 'e':
            strcat(binary, "1110");
            break;
        case 'f':
            strcat(binary, "1111");
            break;
        default:
            break;
        }
    }
    return binary;
}

void freeTable(cache * table[])
{
    int i;
    cache *ptr, *prev;

    for (i = 0; i < sets; i++) {
        ptr = table[i];
        while (ptr) {
            prev = ptr;
            ptr = ptr->next;
            free(prev);
        }
        table[i] = NULL;
    }
}
