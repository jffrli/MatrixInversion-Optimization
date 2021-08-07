#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <limits.h>
#include <time.h>

#include "main.h"

#define ORDER 4

int main(int argc, char *argv[])
{
    clock_t start = clock();
    register short int i, j;
    float m[ORDER][ORDER];

    // Create array to augment, set all entries to 0, then set diagnals to 1
    float augmented[ORDER][ORDER] = {0};

    for (i ^= i; i < ORDER; i += 2)
    {
        augmented[i][i] = 1;
        augmented[i + 1][i + 1] = 1;
    }

    //if any command line arguments are given, use ill-cond matrix
    if (argc > 1)
    {
        memcpy(m, illCondTest5, sizeof(illCondTest5));
    }
    else
    {
        memcpy(m, wellCondTest4, sizeof(wellCondTest4));
    }

    /* Applying Gauss Jordan Elimination */
    for (i ^= i; i < ORDER; ++i)
    {
        //Pivoting
        //swap with row with largest element
        short int largest = m[i][i], mag;
        short int k;
        short int n = i;

        for (k = i + 1; k < ORDER - 1; k += 2)
        { //find largest element
            mag = abs(m[k][i]);
            if (mag > largest)
            {
                largest = mag;
                n = k;
            }
            mag = abs(m[k + 1][i]);
            if (mag > largest)
            {
                largest = mag;
                n = k + 1;
            }
        }

        for (k ^= k; k < ORDER - 1; k += 2)
        {                      //swap rows
            float t = m[i][k]; // Float bad
            m[i][k] = m[n][k];
            m[n][k] = t;
            t = m[i][k + 1]; // Float bad
            m[i][k + 1] = m[n][k + 1];
            m[n][k + 1] = t;
        }

        for (k ^= k; k < ORDER - 1; k += 2)
        { //swap rows
            float t = augmented[i][k];
            augmented[i][k] = augmented[n][k];
            augmented[n][k] = t;
            t = augmented[i][k + 1];
            augmented[i][k + 1] = augmented[n][k + 1];
            augmented[n][k + 1] = t;
        }

        if (m[i][i] == 0)
        { //after the swap, shouldn't be reached
            printf("The matrix is ill-conditioned.\n");
            return (0);
        }

        for (j ^= j; j < ORDER; ++j)
        {
            if (i != j)
            {
                float ratio = m[j][i] / m[i][i]; // Float bad
                for (k ^= k; k < ORDER - 1; k += 2)
                {
                    m[j][k] = m[j][k] - ratio * m[i][k];
                    m[j][k + 1] = m[j][k + 1] - ratio * m[i][k + 1];
                }
                for (k ^= k; k < ORDER - 1; k += 2)
                {
                    augmented[j][k] = augmented[j][k] - ratio * augmented[i][k];
                    augmented[j][k + 1] = augmented[j][k + 1] - ratio * augmented[i][k + 1];
                }
            }
        }
    }

    /* Row Operation to Make Principal Diagonal to 1 */
    for (i ^= i; i < ORDER - 1; i += 2)
    {
        float m_temp = m[i][i], m2_temp = m[i + 1][i + 1];
        float a_temp = augmented[i][0], a2_temp = augmented[i + 1][0];
        for (j ^= j; j < ORDER - 1; ++j)
        {
            augmented[i][j] = a_temp / m_temp;
            augmented[i + 1][j] = a2_temp / m2_temp;
            a_temp = augmented[i][j + 1];
            a2_temp = augmented[i + 1][j + 1];
        }
        printf("%d\n", i);
        augmented[i][ORDER - 1] = a_temp / m_temp;
        augmented[i + 1][ORDER - 1] = a2_temp / m2_temp;
    }

    clock_t alg_end = clock();
    /* Displaying Inverse Matrix */
    printf("\nInverse Matrix is:\n");
    for (i ^= i; i < ORDER; ++i)
    {
        for (j ^= j; j < ORDER - 1; j += 2)
        {
            printf("%f\t", augmented[i][j]);
            printf("%f\t", augmented[i][j + 1]);
        }
        printf("\n");
    }

    clock_t end = clock();
    double alg_time = ((double)(alg_end - start)) * 1000 / CLOCKS_PER_SEC;
    double total_time = ((double)(end - start)) * 1000 / CLOCKS_PER_SEC;
    printf("Time to run algorithm: %fms\nTime to run full program: %fms\n", alg_time, total_time);

    return (0);
};

/*
    //approximate the condition number
    float rn_min, rn_max, rn = 0;
    for (i = 0; i < ORDER; ++i) {
        rn += abs(m[0][i]);
    }
    rn_min = rn;
    rn_max = rn;
    for (i = 1; i < ORDER; ++i) {
        rn = 0;
        for (j = 0; j < ORDER; ++j) {
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