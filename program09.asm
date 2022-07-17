## CS 254 Program 9
##
## Celsius to Fahrenheit : F = C*9/5+32.
##
## Programmer:Giovanni Tshibangu
## Date:4/21/2022
##


    ## Registers Used
    # $f1 Celsius value
    # $f2 value == 9
    # $f3 value == 5
    # $f4 value == 32
  
             .text
             .globl main
main:

#################### Loading immediate Variables 
l.s $f2,valA
l.s $f3,valB
l.s $f4,valC


li   $v0, 4                       # Service code to print                      
la   $a0, prompt                  # print string, prompt
syscall                           # Invoke the OS

li $v0,6                          # Service code to read float
syscall                           # Invoke the OS
mov.s $f1,$f0                     # Copy $f0 entered to $f1

mul.s $f1,$f1,$f2                 # F= c*9,  c= value entered by user 
div.s $f1,$f1,$f3                 # F= F/5 
add.s $f1,$f1,$f4                 # F= F+32

li   $v0, 4                       # Service code to print                      
la   $a0, result                  # print string, result
syscall                           # Invoke the OS

mov.s $f12,$f1                    # Copy F to $f12 to print float value
li $v0,2                          # Service code to print float
syscall                           # Invoke the OS
 
li $v0, 10                        # Exit program
syscall                           # Invoke the OS


# Symbolic Addresses. 

        .data
prompt: .asciiz "Enter Celsius: "
result: .asciiz "Fahrenheit: "
valA:   .float  9.0           
valB:   .float  5.0
valC:   .float  32.0
