#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <limits.h>

#include "main.h"

#define order 5
#define order2 10

int main(int argc, char *argv[])
{
    //float ratio; // will probably need to implement fixed point arith to handle decimals in a short int vs using a float
    int i, j, k, n;
    float m[order][order];

    if (argc > 1)
    { //if any command line arguments are given, use ill-cond matrix
        memcpy(m, illCondTest5, sizeof(illCondTest5));
    }
    else
    {
        memcpy(m, wellCondTest5, sizeof(wellCondTest5));
    }

    /*
    //approximate the condition number
    float rn_min, rn_max, rn = 0;
    for (i = 0; i < order; ++i) {
        rn += abs(m[0][i]);
    }
    rn_min = rn;
    rn_max = rn;
    for (i = 1; i < order; ++i) {
        rn = 0;
        for (j = 0; j < order; ++j) {
            rn += abs(m[i][j]);
        }
        if (rn > rn_max) rn_max = rn;
        if (rn < rn_min) rn_min = rn;
    }
    if (!rn_min) {
        printf("The condition number is approximately infinity.\nThe matrix is singular and has no inverse.\n");
        return(0);
    }
    printf("The condition number is approximately %f.\n", rn_max/rn_min);
    */

    float a[order][order2];
    //initialize array to 0
    memset(a, 0, sizeof(a[0][0]) * order * order2);

    float ratio;

    /* Inputs */
    /* 1. Reading order of matrix */
    /* Augmenting Identity Matrix of Order n */

    for (i ^= i; i < order; ++i)
    {
        for (j ^= j; j < order; ++j)
        {
            a[i][j] = m[i][j];
            if (i == j)
            {
                a[i][j + order] = 1;
            }
        }
    }
    /* Applying Gauss Jordan Elimination */
    for (i ^= i; i < order; ++i)
    {
        //Pivoting
        //swap with row with largest element
        short int largest = a[i][i], mag;
        int n = i;
        for (k = i + 1; k < order; ++k)
        { //find largest element
            mag = abs(a[k][i]);
            if (mag > largest)
            {
                largest = mag;
                n = k;
            }
        }
        for (k ^= k; k < order2; ++k)
        { //swap rows
            float t = a[i][k];
            a[i][k] = a[n][k];
            a[n][k] = t;
        }
        if (a[i][i] == 0)
        { //after the swap, shouldn't be reached
            printf("The matrix is ill-conditioned.\n");
            return (0);
        }

        for (j ^= j; j < order; ++j)
        {
            if (i != j)
            {
                ratio = a[j][i] / a[i][i];
                for (k ^= k; k < order2; ++k)
                {
                    a[j][k] = a[j][k] - ratio * a[i][k];
                }
            }
        }
    }
    /* Row Operation to Make Principal Diagonal to 1 */
    for (i ^= i; i < order; ++i)
    {
        for (j = order; j < order2; ++j)
        {
            a[i][j] = a[i][j] / a[i][i];
        }
    }
    /* Displaying Inverse Matrix */
    printf("\nInverse Matrix is:\n");
    for (i ^= i; i < order; ++i)
    {
        for (j = order; j < order2; ++j)
        {
            printf("%f\t", a[i][j]);
        }
        printf("\n");
    }

    return (0);
};