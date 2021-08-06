#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <limits.h>

#include "main.h"

#define order 5
#define order2 10

int main(int argc, char *argv[])
{
    register int i, j, k;
    float m[order][order];

    // Create array to augment, set all entries to 0, then set diagnals to 1
    float augmented[order][order] = {0};

    for (i ^= i; i < order; ++i)
    {
        augmented[i][i] = 1;
    }

    //if any command line arguments are given, use ill-cond matrix
    if (argc > 1)
    {
        memcpy(m, illCondTest5, sizeof(illCondTest5));
    }
    else
    {
        memcpy(m, wellCondTest5, sizeof(wellCondTest5));
    }

    /* Applying Gauss Jordan Elimination */
    for (i ^= i; i < order; ++i)
    {
        //Pivoting
        //swap with row with largest element
        float largest = m[i][i], mag;
        j = i;

        for (k = i + 1; k < order; ++k)
        { //find largest element
            mag = abs(m[k][i]);
            if (mag > largest)
            {
                largest = mag;
                j = k;
            }
        }

        for (k ^= k; k < order; ++k)
        {                      //swap rows
            mag = m[i][k]; // Float bad
            m[i][k] = m[j][k];
            m[j][k] = mag;
        }
        for (k ^= k; k < order; ++k) //separated for cache reasons
        {                      //swap rows in augmented
            mag = augmented[i][k];
            augmented[i][k] = augmented[j][k];
            augmented[j][k] = mag;
        }

        if (m[i][i] == 0)
        { //after the swap
            printf("The matrix is ill-conditioned.\n");
            return (0);
        }

        for (j ^= j; j < order; ++j)
        {
            if (i != j)
            {
                float ratio = m[j][i] / m[i][i]; // Float bad
                for (k ^= k; k < order; ++k)
                {
                    m[j][k] = m[j][k] - ratio * m[i][k];
                    augmented[j][k] = augmented[j][k] - ratio * augmented[i][k];
                }
            }
        }
    }

    /* Row Operation to Make Principal Diagonal to 1 */
    for (i ^= i; i < order; ++i)
    {
        for (j ^= j; j < order; ++j)
        {
            augmented[i][j] = augmented[i][j] / m[i][i];
        }
    }
    /* Displaying Inverse Matrix */
    printf("\nInverse Matrix is:\n");
    for (i ^= i; i < order; ++i)
    {
        for (j ^= j; j < order; ++j)
        {
            printf("%f\t", augmented[i][j]);
        }
        printf("\n");
    }

    return (0);
};

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