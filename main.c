#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void printinverse(short int order, float m[order][order]) {
    float a[2*order][2*order];
    float ratio;
    int i, j, k, n;
    /* Inputs */
    /* 1. Reading order of matrix */
    /* Augmenting Identity Matrix of Order n */
    for (i = 0; i < 2*order; ++i) { //zeroing the entire array
        memset(a[i],0,2*order*sizeof(float));
    }
    for (i = 0; i < order; ++i)
    {
        for (j = 0; j < order; ++j)
        {
            a[i][j] = m[i][j];
            if (i == j)
            {
                a[i][j + order] = 1;
            }
        }
    }
    /* Applying Gauss Jordan Elimination */
    for (i = 0; i < order; ++i)
    {
        //Pivoting
        //swap with row with largest element
        short int largest = a[i][i];
        int n = i;
        for (k = i+1; k < order; ++k) { //find largest element
            if (a[k][i] > largest) {
                largest = a[k][i];
                n = k;
            }
        }
        for (k = 0; k < 2*order; ++k) { //swap rows
            float t = a[i][k];
            a[i][k] = a[n][k];
            a[n][k] = t;
        }


        for (j = 0; j < order; j++)
        {
            if (i != j)
            {
                ratio = a[j][i] / a[i][i];
                for (k = 0; k < 2 * order; ++k)
                {
                    a[j][k] = a[j][k] - ratio * a[i][k];
                }
            }
        }
    }
    /* Row Operation to Make Principal Diagonal to 1 */
    for (i = 0; i < order; ++i)
    {
        for (j = order; j < 2 * order; ++j)
        {
            a[i][j] = a[i][j] / a[i][i];
        }
    }
    /* Displaying Inverse Matrix */
    printf("\nInverse Matrix is:\n");
    for (i = 0; i < order; ++i)
    {
        for (j = order; j < 2 * order; ++j)
        {
            printf("%f\t", a[i][j]);
        }
        printf("\n");
    }
}

int main()
{
    //float ratio; // will probably need to implement fixed point arith to handle decimals in a short int vs using a float
    //short int order = 2;
    //float a[4][4];
    float m[2][2] = {{0,2},{7,3}};
    printinverse(2,m);
    return (0);
};