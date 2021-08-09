#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <limits.h>
#include <time.h>

#define ORDER 100
#define SHIFT_AMOUNT 16
#define SHIFT_MASK (1 << SHIFT_AMOUNT)

void printMatrix(long long augmented[ORDER][ORDER])
{
    printf("\nInverse Matrix is:\n");
    register short int i, j;
    for (i = 0; i < ORDER; ++i)
    {
        for (j = 0; j < ORDER; ++j)
        {
            printf("%i\t", (short int)augmented[i][j]);
        }
        printf("\n");
    }
}

void gaussJordan(long long m[ORDER][ORDER], long long augmented[ORDER][ORDER])
{
    register short int i, j, k;

    for (i = 0; i < ORDER; ++i)
    {
        for (j = 0; j < ORDER; ++j)
        {
            m[i][j] = m[i][j] << SHIFT_AMOUNT;
        }
        augmented[i][i] = 1 << SHIFT_AMOUNT;
        //printf("\n");
    }

    /* Applying Gauss Jordan Elimination */
    for (i = 0; i < ORDER; ++i)
    {
        //Pivoting
        //swap with row with largest element
        long long largest = m[i][i], mag;
        j = i;

        for (k = i + 1; k < ORDER; ++k)
        { //find largest element
            mag = m[k][i];
            mag = (mag > 0) ? mag : -mag;
            if (mag > largest)
            {
                largest = mag;
                j = k;
            }
        }
        if (i ^ j) { // j != i
            for (k = 0; k < ORDER; ++k)
            { //swap rows
                long long t = m[i][k];
                m[i][k] = m[j][k];
                m[j][k] = t;

                /*
                t = m[i][k + 1];
                m[i][k + 1] = m[j][k + 1];
                m[j][k + 1] = t;
                */
            }
            for (k = 0; k < ORDER; ++k)
            { //swap rows
                long long t = augmented[i][k];
                augmented[i][k] = augmented[j][k];
                augmented[j][k] = t;
                /*
                t = augmented[i][k + 1];
                augmented[i][k + 1] = augmented[j][k + 1];
                augmented[j][k + 1] = t;
                */
            }
        }
        
        largest = m[i][i];
        if (!largest)
        { //after the swap, shouldn't be reached
            printf("The matrix is ill-conditioned.\n");
            exit(0);
        }

        
        for (j = 0; j < ORDER; ++j)
        {
            if (i ^ j) // i != j
            {
                long long ratio = m[j][i]* (SHIFT_MASK) /largest;
                for (k = 0; k < ORDER; ++k)
                {
                    m[j][k] -= ratio*m[i][k]/(SHIFT_MASK);
                }
                for (k = 0; k < ORDER; ++k)
                {
                    augmented[j][k] -= ratio*augmented[i][k]/(SHIFT_MASK);
                }
            }
            //ratio = m[j+1][i]* (SHIFT_MASK) /largest;
        }
    }

    /* Row Operation to Make Principal Diagonal to 1 */
    for (i ^= i; i < ORDER; ++i)
    {
        long long tll = m[i][i];
        //long long denom = (1<<16)*m[i][i];
        for (j ^= j; j < ORDER; ++j)
        {
            augmented[i][j] = augmented[i][j]* (SHIFT_MASK)/ tll;
        }
    }
}

int main(int argc, char *argv[])
{
    if (argc != 2)
    {
        printf("Usage: ./<executable> <matrix input file>\n");
        exit(1);
    }

    clock_t start = clock();
    long long m[ORDER][ORDER];

    // Create array to augment, set all entries to 0, then set diagnals to 1
    long long augmented[ORDER][ORDER] = {0};

    FILE *f;
    short int ii, jj;

    if ((f = fopen(argv[1], "r")) == NULL)
    {
        printf("Bad file name.\n");
        exit(1);
    }

    for (jj = 0; jj < ORDER; jj++)
        for (ii = 0; ii < ORDER; ii++)
            if (fscanf(f, "%lli", &m[jj][ii]) != 1)
            {
                printf("Check file or ORDER constant.\n");
                exit(1);
            }

    fclose(f);

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
