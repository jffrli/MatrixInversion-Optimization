#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* Accepts a matrix and prints its inverse if it exists
 * Arguments:
 *  order, the number of rows/columns in the input matrix.
 *  m, the input matrix with order-rows and order-columns
 * Outputs:
 *  none
*/
void printinverse(short int order, float m[order][order]) {
    float a[2*order][2*order];
    float ratio;
    int i, j, k, n;
    
    for (i = 0; i < 2*order; i++) { //zeroing the entire array
        memset(a[i],0,2*order);
    }

    /* Inputs */
    /* 1. Reading order of matrix */
    /* Augmenting Identity Matrix of Order n */
    for (i = 1; i <= order; i++)
    {
        for (j = 1; j <= order; j++)
        {
            a[i][j] = m[i-1][j-1];
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
    for (i = 0; i <= 2*order; i++)
    {
        for (j = 0; j <= 2 * order; j++)
        {
            printf("%f\t", a[i][j]);
        }
        printf("\n");
    }
    /* Applying Gauss Jordan Elimination */
    for (i = 1; i <= order; i++)
    {
        if (a[i][i] == 0.0)
        {
            // Instead of an error, we need to do a pivot here
            //printf("Implement Pivot");
            //exit(0);
            
            /* Swap with next row where value in column i is non-zero */
            for (k = i+1; k <= order; ++k) {
                if (a[k][i] != 0) {
                    for (int x = 0; x <= 2*order; ++x) {
                      float t = a[i][x];
                      a[i][x] = a[k][x];
                      a[k][x] = t;
                    }
                    break;
                }
            }
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
            printf("%f\t", a[i][j]);
        }
        printf("\n");
    }
}

int main()
{
    float m[2][2] = {{0,2},{7,3}};
    printinverse(2,m);
    return (0);
};
