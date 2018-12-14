#include"first.h"
int inputNum, outputNum, inputs[26], outputs[26], tempVars[26];

//========================================================================//
void readFile(FILE * circFile, FILE * inputFile)
{
    char op[20];
    int val, i, counter = 0;

    fscanf(circFile, "%s %d ", op, &inputNum);
    char inputsVar[inputNum];

    for (i = 0; i < inputNum; i++) {    //record input variable names
        fscanf(circFile, "%c ", &inputsVar[i]);
    }
    fscanf(circFile, "%s %d ", op, &outputNum);
    char outputsVar[outputNum];

    for (i = 0; i < outputNum; i++) {   //record output variable names
        fscanf(circFile, "%c ", &outputsVar[i]);
    }
    while (fscanf(inputFile, "%d ", &val) != EOF) {
        inputs[toIndex(inputsVar[counter])] = val;
        counter++;
        if (counter >= inputNum) {
            counter = 0;
            process(circFile);  //process a single line in inputFile
            for (i = 0; i < outputNum; i++) {
                printf("%d ", outputs[toIndex(outputsVar[i])]);
            }
            printf("\n");
            for (i = 0; i < 26; i++) {
                inputs[i] = 0;
                outputs[i] = 0;
                tempVars[i] = 0;
            }
        }
    }
}
void process(FILE * circFile)
{
    int prev;
    char line[128], linecp[128], *instr, *parameter, dest;
    fpos_t position;

    fgetpos(circFile, &position);
    while (fgets(line, sizeof(line), circFile)) {
        *linecp = '\0';
        strcpy(linecp, line);   //create copy for strtok
        instr = strtok(linecp, " ");
        parameter =
            (char *)malloc(sizeof(char) * (strlen(line) - strlen(instr)));
        strcpy(parameter, line + strlen(instr) + 1);    //parameter = the string after instr
        if (strcmp(instr, "DECODER") == 0) {
            decoder(parameter);
            // free(parameter);
            continue;
        }
        dest = line[strlen(line) - 1];  //dest = last character
        if (dest == 10)         //if dest == new line, go back one
            dest = line[strlen(line) - 2];
        //======================================================================//
        prev = tempVars[toIndex(dest)];
        if (strcmp(instr, "NOT") == 0)
            tempVars[toIndex(dest)] = not(parameter);
        else if (strcmp(instr, "AND") == 0)
            tempVars[toIndex(dest)] = and(parameter);
        else if (strcmp(instr, "OR") == 0)
            tempVars[toIndex(dest)] = or(parameter);
        else if (strcmp(instr, "MULTIPLEXER") == 0)
            tempVars[toIndex(dest)] = multiplexer(parameter);
        if (dest < 'a') {       //not a temp, assign to outputs, restore temp
            outputs[toIndex(dest)] = tempVars[toIndex(dest)];
            tempVars[toIndex(dest)] = prev;
        }
        // free(parameter);
    }
    fsetpos(circFile, &position);
}
int not(char *p)
{
    int n;

    if (*p < 'A')               //number
        n = *p - '0';
    else                        //variable
        n = getValue(*p);
    return n == 0 ? 1 : 0;
}
int and(char *p)
{
    int n1, n2;

    if (*p < 'A')               //number
        n1 = *p - '0';
    else                        //variable
        n1 = getValue(*p);
    if (*(p + 2) < 'A')         //number
        n2 = *(p + 2) - '0';
    else                        //variable
        n2 = getValue(*(p + 2));
    return n1 == 1 && n2 == 1;
}
int or(char *p)
{
    int n1, n2;

    if (*p < 'A')               //number
        n1 = *p - '0';
    else                        //variable
        n1 = getValue(*p);
    if (*(p + 2) < 'A')         //number
        n2 = *(p + 2) - '0';
    else                        //variable
        n2 = getValue(*(p + 2));
    return !(n1 == 0 && n2 == 0);
}
int decoder(char *p)
{
    char *token, *gray = (char *)malloc(sizeof(char) * 32);
    int i, n;

    token = strtok(p, " ");
    n = strtol(token, NULL, 10);
    char decOutputsVar[(int)pow(n, 2)];

    for (i = 0; i < n; i++) {
        token = strtok(NULL, " ");
        *(gray + i) = *token < 'A' ? *token : (char)getValue(*token) + '0';
        *(gray + i + 1) = '\0';
    }
    for (i = 0; i < (int)pow(n, 2); i++) {
        token = strtok(NULL, " ");
        decOutputsVar[i] = *token;
    }
    char ch = decOutputsVar[grayToIndex(gray)];

    if (ch < 'a') {
        outputs[toIndex(ch)] = 1;
    } else {
        tempVars[toIndex(ch)] = 1;
    }
    free(gray);
    return 0;
}
int multiplexer(char *p)
{
    char *token, *gray = (char *)malloc(sizeof(char) * 32);
    int i, n, index;

    token = strtok(p, " ");
    n = strtol(token, NULL, 10);
    int muxInputs[n];

    for (i = 0; i < n; i++) {   //reading inputs
        token = strtok(NULL, " ");
        muxInputs[i] = *token < 'A' ? *token - '0' : getValue(*token);  //number : variable
    }
    for (i = 0; i < (int)(log(n) / log(2)); i++) {      //reading selectors
        token = strtok(NULL, " ");
        *(gray + i) = *token < 'A' ? *token : (char)getValue(*token) + '0';     //number : variable
        *(gray + i + 1) = '\0';
    }
    index = grayToIndex(gray);
    free(gray);
    return muxInputs[index];
}
int toIndex(char c)
{
    return c < 'a' ? c - 'A' : c - 'a';
}
int getValue(char c)
{
    return c < 'a' ? inputs[c - 'A'] : tempVars[c - 'a'];
}
int grayToIndex(char *gray)
{
    int i;

    for (i = 1; i < strlen(gray); i++)
        if (*(gray + i) == '0') //same as previous bit
            *(gray + i) = *(gray + i - 1);
        else                    //opposite of previous bit
            *(gray + i) = *(gray + i - 1) == '0' ? '1' : '0';
    return strtol(gray, NULL, 2);
}
int main(int argc, char **argv)
{
    if (argc != 3) {
        return 0;
    }
    FILE *circFile = fopen(argv[1], "r");
    FILE *inputFile = fopen(argv[2], "r");

    if (!circFile || !inputFile) {
        return 0;
    }
    // FILE *circFile = fopen("c", "r");
    // FILE *inputFile = fopen("i", "r");
    readFile(circFile, inputFile);
    fclose(circFile);
    fclose(inputFile);
    return 0;
}
