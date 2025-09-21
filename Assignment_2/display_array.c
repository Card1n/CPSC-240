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

//display_array.c
//purpose: This file is a function for a larger Array Manager, and is meant to go through the arrays printing values in array
#include <stdio.h>

void display_array(double *arr, long len) {
    
    for (long i = 0; i < len; ++i) {
        printf("%.5f  ", arr[i]);
        if ((i + 1) % 6 == 0) printf("\n");
    }
    
}