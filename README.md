# Matrix Inversion - Seng 440: Embedded Systems

## Developed by Team 6:
### Jeffrey Li - V00887975
### Conor Butte-Landsfried - V00876461

#

## Overview
This file contains the instructions on how to run the Matrix Inversion program as well how to carry out the performance
tests. The folder contains all files required to run the test benches as well as the assembly produced by the C program.
#

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
2. From within the folder run `$arm-linux-gcc -static -o inv.exe main.c`
3. Next run `$./inv.exe <input file>`

### How to run performance tests:
