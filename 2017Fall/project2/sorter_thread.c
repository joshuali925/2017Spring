#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <dirent.h>
#include <string.h>
#include <pthread.h>
#include "processcsv.h"
/* gcc -g -o sorter_thread sorter_thread.c -pthread && ./sorter_thread */
pthread_mutex_t threadlock = PTHREAD_MUTEX_INITIALIZER;
pthread_mutex_t datalock = PTHREAD_MUTEX_INITIALIZER;
pthread_t tid[10000];
int tidindex = 0;
char *coltosort, outname[500], coltype;
int tosort;
char ****alldata;
int alllinelen[10000];
int filecounter = 0;
void appenddir(char *npath, char *path, char *path2)    // npath = path + path2
{
    if (strcmp(path, ".") != 0) {
        strcpy(npath, path);
        strcat(npath, "/");
        strcat(npath, path2);
    } else
        strcpy(npath, path2);
}
void *multisort(void *oripath)
{
    char *path = oripath;
    DIR *dp = opendir(path);
    pthread_t t1;
    pthread_t waittid[3000];
    int countthread = 0, i;
    struct dirent *entry;

    if (dp == NULL) {
        return NULL;
    }
    while (entry = readdir(dp)) {
        if (strcmp(entry->d_name, ".") == 0 || strcmp(entry->d_name, "..") == 0) {
            continue;
        }
        if (entry->d_type == DT_DIR) {
            char newpath[10000] = "";

            sprintf(newpath, "%s/%s", path, entry->d_name);
            pthread_create(&t1, NULL, (void *)&multisort, (void *)&newpath);
            waittid[countthread++] = t1;
            // printf("dir %s: %u\n", newpath, t1);
            pthread_join(t1, NULL);
            pthread_mutex_lock(&threadlock);
            tid[tidindex++] = t1;
            pthread_mutex_unlock(&threadlock);
        } else {
            char filename[10000] = "";

            appenddir(filename, path, entry->d_name);
            if (strlen(filename) < 4
                || strcmp(filename + strlen(filename) - 4, ".csv") != 0) {
                continue;
            }
            pthread_create(&t1, NULL, (void *)&processcsv, (void *)&filename);
            // printf("file %s: %u\n", filename, t1);
            pthread_join(t1, NULL);
            waittid[countthread++] = t1;
            pthread_mutex_lock(&threadlock);
            tid[tidindex++] = t1;
            pthread_mutex_unlock(&threadlock);
        }
    }
    for (i = 0; i < countthread; i++) {
        // pthread_join(waittid[i], NULL);
    }
}
char isnum(char *s)
{
    if (strlen(s) == 0)
        return 's';
    int i;

    if ((s[0] >= '0' && s[0] <= '9') || s[0] == '-' || s[0] == '.') {
        for (i = 1; i < strlen(s); i++)
            if ((s[i] < '0' || s[i] > '9') && s[i] != '.')
                return 's';
    } else
        return 's';
    return 'n';
}
char ***readdata(FILE * fp, int collen, int filecounter, int maxlen)
{
    char ***table = (char ***)malloc(sizeof(char **) * maxlen);
    char c, *buffer = (char *)malloc(sizeof(char) * 10000);
    int i, lineindex = 0, colindex = 0, lastletterindex;

    do {
        table[lineindex] = (char **)malloc(sizeof(char *) * collen);
        colindex = 0;
        do {                    // read a line
            i = 0;
            c = getc(fp);
            /* ================================================================== */
            if (c == '"') {     // process double quotes
                do {
                    c = getc(fp);
                    buffer[i++] = c;
                } while (c != '"');
                buffer[i - 1] = '\0';
            }
            /* ================================================================== */
            while (c == ' ')    // process trailing space
                c = getc(fp);
            lastletterindex = -1;
            while (c != ',' && c != '\n' && c != EOF) { // read a column
                if (c != ' ')
                    lastletterindex = i;
                buffer[i++] = c;
                c = getc(fp);
            }
            buffer[lastletterindex + 1] = '\0';
            /* ================================================================== */
            table[lineindex][colindex] =
                (char *)malloc(sizeof(char) * strlen(buffer) + 1);
            strcpy(table[lineindex][colindex], buffer);
            colindex++;
        } while (c != '\n' && c != EOF);
        if (lineindex == maxlen - 1) {  // need to allocate more space
            maxlen += maxlen;
            table = (char ***)realloc(table, maxlen * sizeof(char **));
        }
        lineindex++;
    } while (c != EOF);
    pthread_mutex_lock(&datalock);
    alllinelen[filecounter] = lineindex - 1;
    pthread_mutex_unlock(&datalock);
    free(table[lineindex - 1][0]);      // free column 0 in extra line
    free(table[lineindex - 1]); // free extra line
    free(buffer);
    return table;
}
void *processcsv(void *oripath)
{
    char *filename = oripath;
    int i, t;
    char *token, *line = (char *)malloc(sizeof(char) * 50000);
    int collen = 0, maxlen = 6000;
    char ***table, **column = (char **)malloc(sizeof(char *) * maxlen);

    /* ================================================================== */
    // read column titles and data
    FILE *fp = fopen(filename, "r");

    fgets(line, 50000, fp);
    token = strtok(line, ",");
    while (token != NULL) {
        column[collen] = (char *)malloc(sizeof(char) * strlen(token) + 1);
        if (collen == maxlen - 1) {     // need to allocate more space
            maxlen += maxlen;
            column = (char **)realloc(column, maxlen * sizeof(char *));
        }
        strcpy(column[collen++], token);
        token = strtok(NULL, ",");
    }
    free(line);
    if (collen != 28) {         // if not valid csv
        for (i = 0; i < collen; i++)
            free(column[i]);
        free(column);
        fclose(fp);
        return NULL;
    }
    table = readdata(fp, collen, filecounter, maxlen);
    if (filecounter == 0) {
        for (i = 0; i < collen; i++)
            if (strcmp(column[i], coltosort) == 0) {
                tosort = i;
                break;
            }
        if (strlen(coltosort) + 2 == strlen(column[collen - 1]))        // check last column
            for (i = 0; i < strlen(coltosort); i++)
                if (coltosort[i] != column[collen - 1][i])
                    tosort = -1;
                else
                    tosort = collen - 1;
        coltype = isnum(table[0][tosort]);
        outputcolumn(column, collen);
        if (tosort == -1)
            return NULL;
    } else {
        for (i = 0; i < collen; i++) {
            free(column[i]);
        }
    }
    free(column);
    mergesort(table, 0, alllinelen[filecounter] - 1, coltype, tosort);
    pthread_mutex_lock(&datalock);
    alldata[filecounter++] = table;
    pthread_mutex_unlock(&datalock);
    fclose(fp);
    return NULL;
}
void outputcolumn(char **column, int collen)
{
    FILE *outdir = fopen(outname, "w");
    int i;

    for (i = 0; i < collen - 1; i++) {
        fprintf(outdir, "%s,", column[i]);
        free(column[i]);
    }
    fprintf(outdir, "%s", column[i]);
    free(column[i]);
    fclose(outdir);
}
int twowaymerge(char ****table, int file1, int file2, int linelen[], int type, int tosort)
{
    int totallen = linelen[file1] + linelen[file2], i = 0, j = 0, k = 0;
    char ***newfile = (char ***)malloc(sizeof(char **) * totallen);
    double comp;

    while (i < linelen[file1] && j < linelen[file2]) {
        if (type == 's')
            comp = strcmp(table[file1][i][tosort], table[file2][j][tosort]);
        else
            comp = atof(table[file1][i][tosort]) - atof(table[file2][j][tosort]);
        if (comp <= 0)
            newfile[k++] = table[file1][i++];
        else
            newfile[k++] = table[file2][j++];
    }
    while (i < linelen[file1])
        newfile[k++] = table[file1][i++];
    while (j < linelen[file2])
        newfile[k++] = table[file2][j++];
    free(table[file1]);
    free(table[file2]);
    table[file1] = newfile;
    linelen[file1] = totallen;
    linelen[file2] = 0;
}
char ***kwaymerge(char ****table, int filenum, int linelen[], int type, int tosort)
{
    int skip = 1, i;

    while (skip < filenum) {
        for (i = 0; i < filenum - skip; i += skip * 2) {
            twowaymerge(table, i, i + skip, linelen, type, tosort);
        }
        skip *= 2;
    }
    return table[0];
}
int main(int argc, char **argv)
{
    coltosort = "director_name";
    char path[500] = ".";
    int c = 1, i, t;
    alldata = (char ****)malloc(sizeof(char ***) * 5000);
    //  if (argc < 3)
    //return 0;
    while (c < argc - 1) {
        if (*(argv[c] + 1) == 'c')
            strcpy(coltosort, argv[c + 1]);
        else if (*(argv[c] + 1) == 'd')
            strcpy(path, argv[c + 1]);
        else if (*(argv[c] + 1) == 'o')
            strcpy(outname, argv[c + 1]);
        c++;
    }
    /* ================================================================== */
    sprintf(outname, "AllFiles-sorted-%s.csv", coltosort);
    multisort(path);
    kwaymerge(alldata, filecounter, alllinelen, coltype, tosort);
    FILE *outdir = fopen(outname, "a");

    for (i = 0; i < alllinelen[0]; i++) {
        for (t = 0; t < 27; t++) {
            if (strchr(alldata[0][i][t], ','))
                fprintf(outdir, "\"%s\",", alldata[0][i][t]);
            else
                fprintf(outdir, "%s,", alldata[0][i][t]);
            free(alldata[0][i][t]);
        }
        if (strchr(alldata[0][i][t], ','))
            fprintf(outdir, "\"%s\"\n", alldata[0][i][t]);
        else
            fprintf(outdir, "%s\n", alldata[0][i][t]);
        free(alldata[0][i][t]);
        free(alldata[0][i]);
    }
    free(alldata[0]);
    free(alldata);
    fclose(outdir);
    /* ================================================================== */
    printf("Initial PID: %d\n", getpid());
    for (i = 0; i < tidindex; i++) {
        printf("%u\n", tid[i]);
    }
    return 0;
}
