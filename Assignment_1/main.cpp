// Program Name: "Delivery Calculator". This program demonstrates.  Copyright (C) 2025 Cardin Phan

// This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License  
// version 3 as published by the Free Software Foundation.                                                                    
// This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied         
// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.      
// A copy of the GNU General Public License v3 is available here: <https://www.gnu.org/licenses/>.

// Author Information:
// Name: Cardin Phan  
// CWID:884699653
// Section: CPSC 240-#13
// Email: phancardin@csu.fullerton.edu

// Program Information:
// Name: Delivery Calculator
// Languages: C++, X86 Assembly
// Start Date: 9/2/2025
// Completion Date:9/6/2025

// Program's Purpose:
// The "Delivery Calculator" will calculate the total driving time and average speed of trucks on delivery routes from three locations from inputs

// Project Information:
// Files: main.c, delivery.asm, r.sh, data.inc
// Developing Computer: Unbuntu Virtual Machine



#include <stdio.h>
#include <iostream>
#include <iomanip>

extern "C" double delivery();

int main(int argc, char* argv[]) {

    //prints starting line
    std::cout << "Welcome to American Express Delivery Service\n";
    
    
    //calls on delivery function to do calculations
    double avg = delivery();
    //prints the average, also sets digits displayed to 2.
    std::cout << "\nThe driver received this number " << std::setprecision(3) << avg
              << " and will keep it for future use." << std::endl;


    std::cout << "Thank you for using my software. Have a nice day.\n";
    std::cout << "An integer zero will be returned to the operating system.\n";
    
    return 0;
}


/*
Welcome to American Express Delivery Service
This software is maintained by <Your Name>.
For assistance contact the developer at <your email address>.
Enter the miles driven from Fullerton to Mission Viejo: 14.5
Enter the average speed (miles per hour) of that leg of the trip: 44.9
Enter the miles driven from Mission Viejo to Long Beach: 16.2
Enter the average speed (miles per hour) of that leg of the trip: 53.1
Enter the miles driven from Long Beach to Fullerton: 13.6
Enter the average speed (miles per hour) of that leg of the trip: 58.2
The total driving time was 7.54 hours.
The average speed was 52.63 m/h
The driver received this number 52.63 and will keep it for future use.
Thank you for using our software. Have a nice day.
An integer zero will be returned to the operating system.
This bash file will now terminate.
*/