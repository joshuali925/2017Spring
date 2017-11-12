/*
gcc sorter.c -o sorter && valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes ./sorter -c duration < m.csv
gcc sorter.c -o sorter && ./sorter -c duration < m.csv
*/
#include "processcsv.h"
int collen = 0, linelen = 0, maxlen = 6000;
char ***table, **column;
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

void readdata(FILE * fp)
{
    table = (char ***)malloc(sizeof(char **) * maxlen);
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
    linelen = lineindex - 1;
    free(table[linelen][0]);    // free column 0 in extra line
    free(table[linelen]);       // free extra line
    free(buffer);
}
int searchcol(char *coltosort)
{
    int i;

    for (i = 0; i < collen; i++)
        if (strcmp(column[i], coltosort) == 0)
            return i;
    if (strlen(coltosort) + 2 == strlen(column[collen - 1]))    // check last column
        for (i = 0; i < strlen(coltosort); i++)
            if (coltosort[i] != column[collen - 1][i])
                return -1;
    return collen - 1;
}
int processcsv(char *filename, char *coltosortstr, char *outname)
{
    // tokenize *coltosortstr into **coltosort
    int i, t, numcoltosort = 0;
    char *token, *line = (char *)malloc(sizeof(char) * 50000), coltosort[28][50];

    token = strtok(coltosortstr, ",");
    while (token != NULL) {
        strcpy(coltosort[numcoltosort], token);
        numcoltosort++;
        token = strtok(NULL, ",");
    }
    /* ================================================================== */
    // read column titles and data
    FILE *fp = fopen(filename, "r");
    column = (char **)malloc(sizeof(char *) * maxlen);
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
        return 0;
    }
    readdata(fp);
    int tosort[numcoltosort];
    char coltype[numcoltosort]; // coltype: s for string, n for numbers

    for (i = 0; i < numcoltosort; i++) {        // there are numcoltosort levels
        tosort[i] = searchcol(coltosort[i]);
        if (tosort[i] == -1)
            return -1;
        coltype[i] = isnum(table[0][tosort[i]]);
    }
    mergesort(table, 0, linelen - 1, coltype, tosort, numcoltosort);
    /* ================================================================== */
    FILE *outdir = fopen(outname, "w");

    // printf("filename = %s\n", filename);
    // printf("outname = %s\n", outname);
    for (i = 0; i < collen - 1; i++) {
        fprintf(outdir, "%s,", column[i]);
        free(column[i]);
    }
    fprintf(outdir, "%s", column[i]);
    free(column[i]);
    free(column);
    fclose(fp);
    for (i = 0; i < linelen; i++) {
        for (t = 0; t < collen - 1; t++) {
            if (strchr(table[i][t], ','))
                fprintf(outdir, "\"%s\",", table[i][t]);
            else
                fprintf(outdir, "%s,", table[i][t]);
            free(table[i][t]);
        }
        if (strchr(table[i][t], ','))
            fprintf(outdir, "\"%s\"\n", table[i][t]);
        else
            fprintf(outdir, "%s\n", table[i][t]);
        free(table[i][t]);
        free(table[i]);
    }
    free(table);
    fclose(outdir);
    /* ====================out put to file/stdin========================= */
    // for (i = 0; i < collen - 1; i++) {
    // printf("%s,", column[i]);
    // free(column[i]);
    // }
    // printf("%s", column[i]);
    // free(column[i]);
    // free(column);
    // fclose(fp);
    // for (i = 0; i < linelen; i++) {
    // for (t = 0; t < collen - 1; t++) {
    // if (strchr(table[i][t], ','))
    // printf("\"%s\",", table[i][t]);
    // else
    // printf("%s,", table[i][t]);
    // free(table[i][t]);
    // }
    // if (strchr(table[i][t], ','))
    // printf("\"%s\"\n", table[i][t]);
    // else
    // printf("%s\n", table[i][t]);
    // free(table[i][t]);
    // free(table[i]);
    // }
    // free(table);
    return 0;
}

// int main()
// {
    // char coltosortstr[] = "duration";
    // processcsv("m.csv", coltosortstr, "o");
    // return 0;
// }
