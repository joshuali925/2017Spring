#include <stdio.h>
#include <stdlib.h>
#include <string.h>
void mergesort(char ***s, int low, int high, char *type, int *tosort, int l)
{
    if (low >= high)
        return;
    int mid = low + (high - low) / 2;

    mergesort(s, low, mid, type, tosort, l);
    mergesort(s, mid + 1, high, type, tosort, l);
	/* ================================================================== */
    // i,j: left/right; k: original s; t: copy to left/right; n: priority sort level
    int i = 0, j = 0, k = low, t, n;
    int lenLeft = mid - low + 1, lenRight = high - mid;
    double comp;
    char ***left = (char ***)malloc(sizeof(char **) * lenLeft);
    char ***right = (char ***)malloc(sizeof(char **) * lenRight);

    for (t = 0; t < lenLeft; t++)
        left[t] = s[low + t];
    for (t = 0; t < lenRight; t++)
        right[t] = s[mid + t + 1];
	/* ================================================================== */
    while (i < lenLeft && j < lenRight) {
        n = 0;
        do {
            if (type[n] == 's')
                comp = strcmp(left[i][tosort[n]], right[j][tosort[n]]);
            else
                comp = atof(left[i][tosort[n]]) - atof(right[j][tosort[n]]);
            n++;
        } while (n < l && comp == 0);
        if (comp > 0)
            s[k++] = right[j++];
        else
            s[k++] = left[i++];
    }
    while (i < lenLeft)
        s[k++] = left[i++];
    while (j < lenRight)
        s[k++] = right[j++];
	/* ================================================================== */
    free(left);
    free(right);
}
