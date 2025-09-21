#!/bin/bash

# Author: Cardin Phan
# Program Name: Delivery Calculator
# Purpose: This bash file will compile the main file, assemble x86 files, and link the whole project together

#compiles delivery.asm
nasm -f elf64 -o delivery.o delivery.asm

#compiles main.cpp to object
g++ -c -m64 -no-pie -Wall -std=c++17 -o main.o main.cpp

#links objects into executable
g++ -m64 -no-pie -std=c++17 -o delivery main.o delivery.o

#how to run program
./delivery

#goodbye message
echo ""
echo "This bash file will now terminate."

