#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <limits.h>
#include <time.h>

#define ORDER 100
#define SHIFT_AMOUNT 16
#define SHIFT_MASK ((1 << SHIFT_AMOUNT) - 1)

long long fixed_multiplication(long long x, long long y)
{
    return (((x) * (y)) / (SHIFT_MASK + 1));
}

long long fixed_division(long long x, long long y)
{
    return (x * (SHIFT_MASK + 1)) / y;
}

void printMatrix(long long augmented[ORDER][ORDER])
{
    printf("\nInverse Matrix is:\n");
    register short int i, j;
    for (i ^= i; i < ORDER; ++i)
    {
        for (j ^= j; j < ORDER - 1; j += 2)
        {
            printf("%i\t", (short int)augmented[i][j]);
            printf("%i\t", (short int)augmented[i][j + 1]);
        }
        printf("\n");
    }
}

void swapRows(long long m[ORDER][ORDER], short int n, short int i)
{
    register short int k;
    for (k ^= k; k < ORDER - 1; k += 2)
    { //swap rows
        long long t = m[i][k];
        m[i][k] = m[n][k];
        m[n][k] = t;
        t = m[i][k + 1];
        m[i][k + 1] = m[n][k + 1];
        m[n][k + 1] = t;
    }
}

void gaussJordan(long long m[ORDER][ORDER], long long augmented[ORDER][ORDER])
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
        //printf("\n");
    }

    /* Applying Gauss Jordan Elimination */
    for (i ^= i; i < ORDER; ++i)
    {
        //Pivoting
        //swap with row with largest element
        long long largest = m[i][i], mag;
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
                long long ratio = fixed_division(m[j][i], m[i][i]); // Float bad
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
        long long m_temp = m[i][i], m2_temp = m[i + 1][i + 1];
        long long a_temp = augmented[i][0], a2_temp = augmented[i + 1][0];
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
    int ii, jj;

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
