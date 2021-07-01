#include <stdio.h>
#include <stdlib.h>

int main()
{
    float ratio; // will probably need to implement fixed point arith to handle decimals in a short int vs using a float
    short int order = 2;
    short int a[4][4];
    a[1][1] = 1;
    a[1][2] = 2;
    a[2][1] = 2;
    a[2][2] = 3;
    int i, j, k, n;
    /* Inputs */
    /* 1. Reading order of matrix */
    /* Augmenting Identity Matrix of Order n */
    for (i = 1; i <= order; i++)
    {
        for (j = 1; j <= order; j++)
        {
            if (i == j)
            {
                a[i][j + order] = 1;
            }
            else
            {
                a[i][j + order] = 0;
            }
        }
    }
    /* Applying Gauss Jordan Elimination */
    for (i = 1; i <= order; i++)
    {
        if (a[i][i] == 0.0)
        {
            // Instead of an error, we need to do a pivot here
            printf("Implement Pivot");
            exit(0);
        }
        for (j = 1; j <= order; j++)
        {
            if (i != j)
            {
                ratio = a[j][i] / a[i][i];
                for (k = 1; k <= 2 * order; k++)
                {
                    a[j][k] = a[j][k] - ratio * a[i][k];
                }
            }
        }
    }
    /* Row Operation to Make Principal Diagonal to 1 */
    for (i = 1; i <= order; i++)
    {
        for (j = order + 1; j <= 2 * order; j++)
        {
            a[i][j] = a[i][j] / a[i][i];
        }
    }
    /* Displaying Inverse Matrix */
    printf("\nInverse Matrix is:\n");
    for (i = 1; i <= order; i++)
    {
        for (j = order + 1; j <= 2 * order; j++)
        {
            printf("%d\t", a[i][j]);
        }
        printf("\n");
    }
    return (0);
};
