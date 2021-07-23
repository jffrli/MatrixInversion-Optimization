#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void printinverse(int order, int m[order][order]) {
	int a[2*order][2*order];
	int sf[order][order];
	register int v1, v2;
	int i, j, k, n;
	/* Inputs */
	/* 1. Reading order of matrix */
	/* Augmenting Identity Matrix of Order n */
	for (i = 0; i < 2*order; ++i) { //zeroing the entire array
		memset(a[i],0,2*order*sizeof(int));
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

	// Initializing scale factors with 1
	for (i = 0; i < order; ++i)
	{
		for (j = 0; j < order; ++j)
		{
			sf[i][j] = 1;
		}
	}

	/* Applying Gauss Jordan Elimination */
	for (i = 0; i < order; ++i)
	{
		//Pivoting
		//swap with row with largest element
		v1 = abs(a[i][i]); //largest tracker
		n = i;
		for (k = i+1; k < order; ++k) { //find largest element
			v2 = abs(a[k][i]);
			if (v2*sf[n][i] > v1*sf[k][i]) {
				v1 = v2;
				n = k;
			}
		}
		
		if (n != i) {
		    for (k = 0; k < 2*order; ++k) { //swap rows
    			v1 = a[i][k];
    			a[i][k] = a[n][k];
    			a[n][k] = v1;
    		}
    		for (k = 0; k < 2*order; ++k) { //swap scale factors
    			v1 = sf[i][k];
    			sf[i][k] = sf[n][k];
    			sf[n][k] = v1;
    		}   
		}

		if (a[i][i] == 0) {//after the swap
			printf("This matrix is singular.\n");
			return;
		}


		for (j = 0; j < order; j++)
		{
			if (i != j)
			{
				v1 = a[i][i];
				v2 = a[j][i];
				for (k = 0; k < 2 * order; ++k)
				{
					a[j][k] = a[j][k]*v1*sf[i][k] - a[i][k]*sf[j][k]*v2;
					sf[j][k] *= v1*sf[i][k];
				}
			}
		}
	}
	/* Row Operation to Make Principal Diagonal to 1 */
	for (i = 0; i < order; ++i)
	{
		for (j = order; j < 2 * order; ++j)
		{
			sf[i][j] *= a[i][i];
			
			if (sf[i][j] < 0) {//keep the scale factors positive
			    a[i][j] *= -1;
			    sf[i][j] *= -1;
			}
		}
	}
	/* Displaying Inverse Matrix */
	printf("\nInverse Matrix is:\n");
	for (i = 0; i < order; ++i)
	{
		for (j = order; j < 2 * order; ++j)
		{
			printf("%d\t", a[i][j]);
		}
		printf("\n");
	}

	/* Displaying Scale Factors */
	printf("\nScale Factor Matrix is:\n");
	for (i = 0; i < order; ++i)
	{
		for (j = order; j < 2 * order; ++j)
		{
			printf("%d\t", sf[i][j]);
		}
		printf("\n");
	}
}

int main()
{
	//short int ratio; // will probably need to implement fixed point arith to handle decimals in a short int vs using a short int
	//short int order = 2;
	//short int a[4][4];
	short int m[2][2] = {{0,2},{7,3}};
	printinverse(2,m);
	return (0);
};