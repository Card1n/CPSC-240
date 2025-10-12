// Program Name: "Array Manager". This program demonstrates.  Copyright (C) 2025 Cardin Phan

// This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License  
// version 3 as published by the Free Software Foundation.                                                                    
// This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied         
// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.      
// A copy of the GNU General Public License v3 is available here: <https://www.gnu.org/licenses/>.

// Author Information:
// Name: Cardin Phan  
// CWID: 884699653
// Section: CPSC 240-#13
// Email: phancardin@csu.fullerton.edu

// Program Information:
// Name: Array Manager
// Languages: C, X86 Assembly
// Start Date: 9/2/2025
// Completion Date:9/6/2025

// Program's Purpose:
// This array manager is meant to showcase how to make arrays in x86, and modify/calculate values from them using iterations and math. it will be used to find numbers like magnitude and mean of arrays.
// Project Information:
// Files: main.c, append.asm, input_array.asm, isfloat.asm, magnitude.asm, manager.asm, mean.asm, r.sh, macros.inc
// Developing Computer: Unbuntu Virtual Machine

#include <stdio.h>

extern double manager(void);

int main(void) {
    printf("Welcome to GDB Learning Place\n");
   

    double value = manager();




    printf("\nThe driver function received this number %.1f., and will keep it for future use.\n", value);
    printf("A zero will be sent to the operating system.  Bye.\n");
    
    return 0;

}

