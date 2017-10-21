#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <dirent.h>
#include <string.h>
#include <wait.h>
#include "sorter.c"
/*
gcc -g main.c -o main && ./main
*/
int initpid, childnum = 0;
pid_t childpids[300];
void appenddir(char *npath, char *path, char *path2)    // npath = path + path2
{
    if (strcmp(path, ".") != 0) {
        strcpy(npath, path);
        strcat(npath, "/");
        strcat(npath, path2);
    } else
        strcpy(npath, path2);
}

pid_t getvalidpid(pid_t dirpid, pid_t filepid)  // return the valid one
{
    if (dirpid > 0)
        return dirpid;
    if (filepid > 0)
        return filepid;
    return -1;
}
int checkdir(char *path, char *coltosort, char *outdir, int *fd)
{
    struct dirent *entry;
    DIR *dp;

    dp = opendir(path);
    if (dp == NULL)
        return -1;
    while (entry = readdir(dp)) {
        if (strcmp(entry->d_name, ".") == 0 || strcmp(entry->d_name, "..") == 0)
            continue;
        pid_t dirpid = -1, filepid = -1;
        int dirstat = 0, filestat = 0;
        char npath[300], filename[500];

        if (entry->d_type == DT_DIR) {  // if is directory
            appenddir(npath, path, entry->d_name);
            dirpid = fork();
            if (dirpid == 0) {  // child, check new path
                checkdir(npath, coltosort, outdir, fd);
                exit(0);
            } else if (dirpid > 0) {    // parent, forked a child for dir
                // printf("%d forked %d for dir:  %s\n", getpid(), dirpid, npath);
                waitpid(dirpid, &dirstat, 0);
            } else
                return -1;
            /* ================================================================== */
        } else {                // if is file
            appenddir(filename, path, entry->d_name);
            if (strlen(filename) < 4
                || strcmp(filename + strlen(filename) - 4, ".csv") != 0
                || strstr(filename, "-sorted-"))
                continue;
            filepid = fork();
            if (filepid == 0) { // child, sort csv
                char outname[500];
                int namestart = 0, i = 0;

                while (*(filename + i)) // get where filename starts a/b/c.csv
                    if (*(filename + i++) == '/')
                        namestart = i;
                appenddir(outname, outdir, filename + namestart);
                *(outname + strlen(outname) - 4) = '\0';        // no extension
                strcat(outname, "-sorted-");
                strcat(outname, coltosort);
                strcat(outname, ".csv");
                processcsv(filename, coltosort, outname);
                exit(0);
            } else if (filepid > 0) {   // parent, forked a child for csv
                // printf("%d forked %d for file: %s\n", getpid(), filepid, filename);
                waitpid(filepid, &filestat, 0);
            } else
                return -1;
        }
        /* ================================================================== */
        if (getpid() != initpid) {      // not initial process, pass up metadata
            pid_t childpid = getvalidpid(dirpid, filepid);

            if (childpid < 0)   // has no children
                continue;
            char pipebuffer[300] = "", childstr[50];

            read(fd[0], pipebuffer, sizeof(pipebuffer));
            sprintf(childstr, ",%d", childpid);
            strcat(pipebuffer, childstr);
            write(fd[1], pipebuffer, sizeof(pipebuffer));
            // printf("sent = |%s|\n", pipebuffer);
        } else {                // initial process, record metadata
            pid_t childpid = getvalidpid(dirpid, filepid);

            if (childpid > 0)
                childpids[childnum++] = childpid;
        }
    }
    closedir(dp);
    return 0;
}
int main(int argc, char **argv)
{
    char path[500] = ".", outdir[500] = ".", coltosort[500] = "duration";
    int c = 1, i, fd[2], countchild = 0;

    initpid = getpid();
    // if (argc < 3)
    // return 0;
    while (c < argc - 1) {
        if (*(argv[c] + 1) == 'c')
            strcpy(coltosort, argv[c + 1]);
        else if (*(argv[c] + 1) == 'd')
            strcpy(path, argv[c + 1]);
        else if (*(argv[c] + 1) == 'o')
            strcpy(outdir, argv[c + 1]);
        c++;
    }
    pipe(fd);
    write(fd[1], "0", 2);
    checkdir(path, coltosort, outdir, fd);
    char pipebuffer[300] = "";

    read(fd[0], pipebuffer, sizeof(pipebuffer));

    for (i = 0; i < childnum - 1; i++)
        printf("%d,", childpids[i]);
    countchild = i + 1;
    for (i = 0; i < strlen(pipebuffer); i++)
        if (pipebuffer[i] == ',')
            countchild++;
    printf
        ("Initial PID: %d\nPIDS of all child processes: %d%s\nTotal number of processes: %d\n",
         initpid, childpids[i], pipebuffer + 1, countchild);
    return 0;
}