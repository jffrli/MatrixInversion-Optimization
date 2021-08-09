# Matrix Inversion - Seng 440: Embedded Systems

## Developed by Team 6:
### Jeffrey Li - V00887975
### Conor Butte-Landsfried - V00876461

#

## Overview
This file contains the instructions on how to run the Matrix Inversion program as well how to carry out the performance
tests. The folder contains all files required to run the test benches as well as the assembly produced by the C program.
#


## Input and Output
The input of the program should be a text file containing a matrix of 11-bit integers. The input should not be scaled in
any way. The program introduces a scale factor of 2^16, which is reflected in the output. To get the unscaled, floating
point form of the inverse, divide each element in the output by the scale factor 2^16.


## Contents
### Input Files:
- ill-cond.txt (Ill conditioned 100x100 matrix)
- well-cond.txt (Well conditioned 100x100 matrix)
### Assembly Files:
- main.s
- main-verbose.s
### C Code:
- main.c
#

### How to run:
1. Start the VM and download this folder.
2. From within the folder run `$arm-linux-gcc -static -o inv.out main.c`
3. Next run `$./inv.out <input file>`

### How to run performance tests:
#### Gprof
1. Make sure Gprof is installed or install it.
2. Compile using GCC with the -g -pg flags with `arm-linux-gcc -g -pg -static -o inv.out main.c`
3. Run the program normally with `$./inv.out <input file>`
4. Run gprof on the program with `$gprof inv.out`
#### Cachegrind
1. Make sure Valgrind is installed or install it.
2. Compile the program normally with `$arm-linux-gcc -static -o inv.out main.c`
3. Run cachegrind on the program with `$valgrind --tool=cachegrind ./inv.out <input file>`
