#include "sorter_thread.h"
#include <sys/time.h>
#include <signal.h>
#include <errno.h>
/*
for i in {0000..1024}; do cp m.csv m--$i.csv; done
gcc -g -o sorter_thread sorter_thread.c -pthread && ./sorter_thread
gcc sorter_thread.c -o sorter_thread -pthread && valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes ./sorter_thread
*/
pthread_mutex_t threadlock = PTHREAD_MUTEX_INITIALIZER;
pthread_mutex_t datalock = PTHREAD_MUTEX_INITIALIZER;
pthread_mutex_t pathlock = PTHREAD_MUTEX_INITIALIZER;
int tidindex = 0;
pthread_t tid[10000];
char ****alldata, *column, coltosort[50], outname[500], coltype;
int tosort, linelen[10000], collen = 28;
int filecounter = 0;
char paths[1000][300];
int pathcounter = 0;
void sig_handler(int signo)
{
    if (signo == SIGSEGV)
        printf("%s\n", __func__);
}
void *traversedir(void *oripath)
{
    char *path = oripath;
    DIR *dp = opendir(path);
    pthread_t currtid;
    pthread_t waittid[10000];
    int countthread = 0, i, localcounter = 0, chunk = 512, joined = 0;
    struct dirent *entry;

    if (dp == NULL) {
        printf("failed to read dir %s: %s\n", path, strerror(errno));
        return NULL;
    }
    while (entry = readdir(dp)) {
        if (strcmp(entry->d_name, ".") == 0 || strcmp(entry->d_name, "..") == 0)
            continue;
        pthread_mutex_lock(&pathlock);
        localcounter = pathcounter % 1000;
        pathcounter++;
        pthread_mutex_unlock(&pathlock);
        sprintf(paths[localcounter], "%s/%s", path, entry->d_name);
        if (entry->d_type == DT_DIR) {
            pthread_create(&currtid, NULL, (void *)&traversedir,
                           (void *)&paths[localcounter]);
        } else {
            if (strlen(paths[localcounter]) < 4
                || strcmp(paths[localcounter] + strlen(paths[localcounter]) - 4,
                          ".csv") != 0 || strstr(paths[localcounter], "-sorted-"))
                continue;
            pthread_create(&currtid, NULL, (void *)&processcsv,
                           (void *)&paths[localcounter]);
        }
        waittid[countthread++] = currtid;
        pthread_mutex_lock(&threadlock);
        tid[tidindex++] = currtid;
        pthread_mutex_unlock(&threadlock);
        // pthread_join(currtid, NULL);
        if (countthread == chunk) {
            for (i = joined; i < countthread; i++) {
                pthread_join(waittid[i], NULL);
            }
            joined = countthread;
            chunk += 512;
        }
    }
    for (i = joined; i < countthread; i++) {
        pthread_join(waittid[i], NULL);
    }
    closedir(dp);
}
void *processcsv(void *oripath)
{
    char *filename = oripath, *line = (char *)malloc(sizeof(char) * 5000), ***table;
    int i, t;
    FILE *fp = fopen(filename, "r");

    if (fp == NULL) {
        printf("filed to open %s: %s\n", filename, strerror(errno));
        return NULL;
    }
    fgets(line, 5000, fp);
    if (filecounter == 0) {
        column = line;
    } else {
        free(line);
    }
    /* ================================================================== */
    pthread_mutex_lock(&datalock);
    int localcounter = filecounter++;

    pthread_mutex_unlock(&datalock);
    table = readdata(fp, localcounter);
    fclose(fp);
    mergesort(table, 0, linelen[localcounter] - 1, coltype, tosort);
    alldata[localcounter] = table;
    return NULL;
}
int main(int argc, char **argv)
{
    strcpy(coltosort, "director_name");
    char path[500] = ".", outpath[500] = ".";
    int c = 1, i, t;

    // signal(SIGSEGV, sig_handler);
    alldata = (char ****)malloc(sizeof(char ***) * 10000);
    if (argc < 3)
        return 0;
    while (c < argc - 1) {
        if (*(argv[c] + 1) == 'c')
            strcpy(coltosort, argv[c + 1]);
        else if (*(argv[c] + 1) == 'd')
            strcpy(path, argv[c + 1]);
        else if (*(argv[c] + 1) == 'o')
            strcpy(outpath, argv[c + 1]);
        c += 2;
    }
    getcolinfo();
    sprintf(outname, "%s/AllFiles-sorted-%s.csv", outpath, coltosort);
    /* ================================================================== */
    struct timeval t0, t1;
    long msec;

    // gettimeofday(&t0, 0);
    traversedir(path);
    // gettimeofday(&t1, 0);
    // msec = (t1.tv_sec - t0.tv_sec) * 1000000 + t1.tv_usec - t0.tv_usec;
    // printf("\nread/sort used\t%d.%d sec\n", msec / 1000000, msec % 1000000);
    // gettimeofday(&t0, 0);
    kwaymerge();
    // gettimeofday(&t1, 0);
    // msec = (t1.tv_sec - t0.tv_sec) * 1000000 + t1.tv_usec - t0.tv_usec;
    // printf("merging used\t%d.%d sec\n", msec / 1000000, msec % 1000000);
    // gettimeofday(&t0, 0);
    outputfile();
    // gettimeofday(&t1, 0);
    // msec = (t1.tv_sec - t0.tv_sec) * 1000000 + t1.tv_usec - t0.tv_usec;
    // printf("output used\t%d.%d sec\n", msec / 1000000, msec % 1000000);
    // printf("total \t\t%d lines\n", linelen[0]);
    // printf("total \t\t%d files\n\n\n", filecounter);
    /* ================================================================== */
    pthread_mutex_destroy(&threadlock);
    pthread_mutex_destroy(&datalock);
    pthread_mutex_destroy(&pathlock);
    printf("Initial PID: %d\n", getpid());
    for (i = 0; i < tidindex - 1; i++) {
        printf("%u,", tid[i]);
    }
    printf("%u\nTotal number of threads: %d\n", tid[i], tidindex + 1);
    return 0;
}

/* ================================================================== */
/* ================================================================== */
/* ================================================================== */
void *twowaymerge(void *context)
{
    int *file = context, file1 = file[0], file2 = file[1];
    int totallen = linelen[file1] + linelen[file2], i = 0, j = 0, k = 0;
    char ***newfile = (char ***)malloc(sizeof(char **) * totallen);
    double comp;

    while (i < linelen[file1] && j < linelen[file2]) {
        if (coltype == 's')
            comp = strcmp(alldata[file1][i][tosort], alldata[file2][j][tosort]);
        else
            comp = atof(alldata[file1][i][tosort]) - atof(alldata[file2][j][tosort]);
        if (comp <= 0)
            newfile[k++] = alldata[file1][i++];
        else
            newfile[k++] = alldata[file2][j++];
    }
    while (i < linelen[file1])
        newfile[k++] = alldata[file1][i++];
    while (j < linelen[file2])
        newfile[k++] = alldata[file2][j++];
    free(alldata[file1]);
    free(alldata[file2]);
    alldata[file1] = newfile;
    linelen[file1] = totallen;
    linelen[file2] = 0;
}

void kwaymerge()
{
    int skip = 1, i, countthread = 0;
    pthread_t currtid;
    // pthread_t waittid[3000];
    // int context[3000][2];
    int context[1][2];

    while (skip < filecounter) {
        for (i = 0; i < filecounter - skip; i += skip * 2) {
            context[countthread][0] = i;
            context[countthread][1] = i + skip;
            twowaymerge(&context);
            // pthread_create(&currtid, NULL, (void *)&twowaymerge,
                           // (void *)&context[countthread]);
            // waittid[countthread++] = currtid;
            // pthread_mutex_lock(&threadlock);
            // tid[tidindex++] = currtid;
            // pthread_mutex_unlock(&threadlock);
        }
        // for (i = 0; i < countthread; i++) {
            // pthread_join(waittid[i], NULL);
        // }
        // countthread = 0;
        skip *= 2;
    }
}
char ***readdata(FILE * fp, int localcounter)
{
    int i, lineindex = 0, colindex = 0, lastletterindex, maxlen = 6000;
    char ***table = (char ***)malloc(sizeof(char **) * maxlen);
    char c, *buffer = (char *)malloc(sizeof(char) * 10000);

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
    linelen[localcounter] = lineindex - 1;
    free(table[lineindex - 1][0]);      // free column 0 in extra line
    free(table[lineindex - 1]); // free extra line
    free(buffer);
    return table;
}

void outputfile()
{
    FILE *outdir = fopen(outname, "w");
    int i, t, counter = 1;

    fprintf(outdir, "%s", column);
    free(column);
    for (i = 0; i < linelen[0]; i++) {
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
        // if (i & counter) {
        // printf("outputted line %d\n", i);
        // counter <<= 1;
        // }
    }
    free(alldata[0]);
    free(alldata);
    fclose(outdir);
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

void getcolinfo()
{
    if (strcmp(coltosort, "color") == 0) {
        tosort = 0;
        coltype = 's';
    } else if (strcmp(coltosort, "director_name") == 0) {
        tosort = 1;
        coltype = 's';
    } else if (strcmp(coltosort, "num_critic_for_reviews") == 0) {
        tosort = 2;
        coltype = 'n';
    } else if (strcmp(coltosort, "duration") == 0) {
        tosort = 3;
        coltype = 'n';
    } else if (strcmp(coltosort, "director_facebook_likes") == 0) {
        tosort = 4;
        coltype = 'n';
    } else if (strcmp(coltosort, "actor_3_facebook_likes") == 0) {
        tosort = 5;
        coltype = 'n';
    } else if (strcmp(coltosort, "actor_2_name") == 0) {
        tosort = 6;
        coltype = 's';
    } else if (strcmp(coltosort, "actor_1_facebook_likes") == 0) {
        tosort = 7;
        coltype = 'n';
    } else if (strcmp(coltosort, "gross") == 0) {
        tosort = 8;
        coltype = 's';
    } else if (strcmp(coltosort, "genres") == 0) {
        tosort = 9;
        coltype = 's';
    } else if (strcmp(coltosort, "actor_1_name") == 0) {
        tosort = 10;
        coltype = 's';
    } else if (strcmp(coltosort, "movie_title") == 0) {
        tosort = 11;
        coltype = 's';
    } else if (strcmp(coltosort, "num_voted_users") == 0) {
        tosort = 12;
        coltype = 'n';
    } else if (strcmp(coltosort, "cast_total_facebook_likes") == 0) {
        tosort = 13;
        coltype = 'n';
    } else if (strcmp(coltosort, "actor_3_name") == 0) {
        tosort = 14;
        coltype = 's';
    } else if (strcmp(coltosort, "facenumber_in_poster") == 0) {
        tosort = 15;
        coltype = 'n';
    } else if (strcmp(coltosort, "plot_keywords") == 0) {
        tosort = 16;
        coltype = 's';
    } else if (strcmp(coltosort, "movie_imdb_link") == 0) {
        tosort = 17;
        coltype = 's';
    } else if (strcmp(coltosort, "num_user_for_reviews") == 0) {
        tosort = 18;
        coltype = 'n';
    } else if (strcmp(coltosort, "language") == 0) {
        tosort = 19;
        coltype = 's';
    } else if (strcmp(coltosort, "country") == 0) {
        tosort = 20;
        coltype = 's';
    } else if (strcmp(coltosort, "content_rating") == 0) {
        tosort = 21;
        coltype = 's';
    } else if (strcmp(coltosort, "budget") == 0) {
        tosort = 22;
        coltype = 'n';
    } else if (strcmp(coltosort, "title_year") == 0) {
        tosort = 23;
        coltype = 'n';
    } else if (strcmp(coltosort, "actor_2_facebook_likes") == 0) {
        tosort = 24;
        coltype = 'n';
    } else if (strcmp(coltosort, "imdb_score") == 0) {
        tosort = 25;
        coltype = 'n';
    } else if (strcmp(coltosort, "aspect_ratio") == 0) {
        tosort = 26;
        coltype = 'n';
    } else if (strcmp(coltosort, "movie_facebook_likes") == 0) {
        tosort = 27;
        coltype = 'n';
    } else {
        exit(1);
    }
}
