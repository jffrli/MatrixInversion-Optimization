#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <limits.h>
#include <time.h>

#include "main.h"

#define ORDER 100
#define SHIFT_AMOUNT 16
#define SHIFT_MASK ((1 << SHIFT_AMOUNT) - 1)

long int fixed_multiplication(long int x, long int y)
{
    return ((((long long)x) * ((long long)y)) / (SHIFT_MASK + 1));
}

long int fixed_division(long int x, long int y)
{
    return ((long long)x * (SHIFT_MASK + 1)) / y;
}

void printMatrix(long int augmented[ORDER][ORDER])
{
    printf("\nInverse Matrix is:\n");
    register short int i, j;
    for (i ^= i; i < ORDER; ++i)
    {
        for (j ^= j; j < ORDER - 1; j += 2)
        {
            printf("%ld\t", augmented[i][j]);
            printf("%ld\t", augmented[i][j + 1]);
        }
        printf("\n");
    }
}

void swapRows(long int m[ORDER][ORDER], short int n, short int i)
{
    register short int k;
    for (k ^= k; k < ORDER - 1; k += 2)
    {                         //swap rows
        long int t = m[i][k]; // Float bad
        m[i][k] = m[n][k];
        m[n][k] = t;
        t = m[i][k + 1]; // Float bad
        m[i][k + 1] = m[n][k + 1];
        m[n][k + 1] = t;
    }
}

void gaussJordan(long int m[ORDER][ORDER], long int augmented[ORDER][ORDER])
{
    register short int i, j;
    for (i ^= i; i < ORDER; i += 2)
    {
        augmented[i][i] = 1 << SHIFT_AMOUNT;
        augmented[i + 1][i + 1] = 1 << SHIFT_AMOUNT;
    }

    for (i ^= i; i < ORDER; ++i)
    {
        for (j ^= j; j < ORDER; ++j)
        {
            m[i][j] = m[i][j] << SHIFT_AMOUNT;
        }
    }

    /* Applying Gauss Jordan Elimination */
    for (i ^= i; i < ORDER; ++i)
    {
        //Pivoting
        //swap with row with largest element
        long int largest = m[i][i], mag;
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

        swapRows(m, n, i);
        swapRows(augmented, n, i);

        if (m[i][i] == 0)
        { //after the swap, shouldn't be reached
            printf("The matrix is ill-conditioned.\n");
            exit(0);
        }

        for (j ^= j; j < ORDER; ++j)
        {
            if (i != j)
            {
                long int ratio = fixed_division(m[j][i], m[i][i]); // Float bad
                for (k ^= k; k < ORDER - 1; k += 2)
                {
                    m[j][k] = m[j][k] - fixed_multiplication(ratio, m[i][k]);
                    m[j][k + 1] = m[j][k + 1] - fixed_multiplication(ratio, m[i][k + 1]);
                }
                for (k ^= k; k < ORDER - 1; k += 2)
                {
                    augmented[j][k] = augmented[j][k] - fixed_multiplication(ratio, augmented[i][k]);
                    augmented[j][k + 1] = augmented[j][k + 1] - fixed_multiplication(ratio, augmented[i][k + 1]);
                }
            }
        }
    }

    /* Row Operation to Make Principal Diagonal to 1 */
    for (i ^= i; i < ORDER - 1; i += 2)
    {
        long int m_temp = m[i][i], m2_temp = m[i + 1][i + 1];
        long int a_temp = augmented[i][0], a2_temp = augmented[i + 1][0];
        for (j ^= j; j < ORDER - 1; ++j)
        {
            augmented[i][j] = fixed_division(a_temp, m_temp);
            augmented[i + 1][j] = fixed_division(a2_temp, m2_temp);
            a_temp = augmented[i][j + 1];
            a2_temp = augmented[i + 1][j + 1];
        }
        augmented[i][ORDER - 1] = fixed_division(a_temp, m_temp);
        augmented[i + 1][ORDER - 1] = fixed_division(a2_temp, m2_temp);
    }
}

int main(int argc, char *argv[])
{
    clock_t start = clock();
    long int m[ORDER][ORDER];
    printf("%ld\n", sizeof(long int) * CHAR_BIT);
    // Create array to augment, set all entries to 0, then set diagnals to 1
    long int augmented[ORDER][ORDER] = {0};

    //if any command line arguments are given, use ill-cond matrix
    if (argc > 1)
    {
        memcpy(m, illCondTest5, sizeof(illCondTest5));
    }
    else
    {
        memcpy(m, wellCond, sizeof(wellCond));
    }

    gaussJordan(m, augmented);

    clock_t alg_end = clock();
    /* Displaying Inverse Matrix */
    printMatrix(augmented);

    clock_t end = clock();
    double alg_time = ((double)(alg_end - start)) * 1000 / CLOCKS_PER_SEC;
    double total_time = ((double)(end - start)) * 1000 / CLOCKS_PER_SEC;
    printf("Time to run algorithm: %fms\nTime to run full program: %fms\n", alg_time, total_time);

    return (0);
};

// ((((long long)x) * ((long long)y)) / (SHIFT_MASK + 1))
// ((long long)x * (SHIFT_MASK + 1)) / y;

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