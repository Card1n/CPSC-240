#!/bin/bash

# Author: Cardin Phan
# Program Name: Array Manager
# Purpose: This bash file will compile the main file, assemble x86 files, and link the whole project together

# r.sh - build script for the hybrid program

nasm -felf64 manager.asm -o manager.o
nasm -felf64 input_array.asm -o input_array.o
nasm -felf64 isfloat.asm -o isfloat.o 
nasm -felf64 sum.asm -o sum.o
nasm -felf64 swap.asm -o swap.o

gcc -c -m64 -Wall -fno-pie -o display_array.o display_array.c
gcc -c -m64 -Wall -fno-pie -o main.o main.c
gcc -c -m64 -Wall -fno-pie -o sort.o sort.c
gcc -no-pie main.o manager.o input_array.o isfloat.o display_array.o sum.o sort.o swap.o -o arrays_prog -lm

#run program with bash r.sh, then ./arrays_prog
