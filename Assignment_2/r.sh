#!/bin/bash

# Author: Cardin Phan
# Program Name: Array Manager
# Purpose: This bash file will compile the main file, assemble x86 files, and link the whole project together

# r.sh - build script for the hybrid program

nasm -felf64 manager.asm -o manager.o
nasm -felf64 input_array.asm -o input_array.o
nasm -felf64 isfloat.asm -o isfloat.o #need to replace this with public C libary with citation
#g++ -c -m64 -Wall -fno-pie -no-pie -o isfloat.o isfloat.cpp -std=c++17
gcc -c display_array.c -o display_array.o
nasm -felf64 append.asm -o append.o
nasm -felf64 magnitude.asm -o magnitude.o
nasm -felf64 mean.asm -o mean.o
gcc -c main.c -o main.o
gcc -no-pie main.o manager.o input_array.o isfloat.o display_array.o append.o magnitude.o mean.o -o arrays_prog -lm

#run program with bash r.sh, then ./arrays_prog
