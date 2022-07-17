## CS 254 Program 5 Spring 2022
##

## Compute (8x2-3x+12) / (3x2+2x-16)

## Programmer: Giovanni Tshibangu
## Date: 03/11/2022



    ## Registers Used
    # $5 is used for X value
    # $10 is a based register
    # $11 Will store the values of the Denominator
    # $0 No-Op
    # $9 Will just hold the value of our constant in the equations and will be cleared at the end.
    # $12 will hold the value of the Numerator, During the operations
    # $8 will store the Error value



             .text
             .globl main

main: 

lui $10,0x1000                    # Initialize Base register

lw $5,0($10)                      # Load X into $5
								
addiu $11,$0,3                    # adding 13 to $11

mult $11,$5                       #3x
mflo $11
sll $0,$0,0


addiu $11,$11,2                   # 3x+2

mult $11,$5                       # 3x^2+2x
mflo $11
sll $0,$0,0
ori $9,$0,16                      # Assigns 16 to $7

subu $11,$11,$9                   # (3x^2+2x)-16
andi $9,$0,0                      #Clear register $9


 ### Working With Numerator


addiu $12,$0,8                    # adding 8 to $12

mult $12,$5                       # Assign 8x to $12
mflo $12

sll $0,$0,0
ori $9,$0,3                       # Assigns 3 to $9
subu $12,$12,$9                   # 8x-3

mult $12,$5                       # 8x^2-3x
mflo $12

sll $0,$0,0
addiu $12,$12,12                  #  (8x^2+3x)+12
andi $9,$0,0                      # Clear register $9

addiu $8,$0,0                     # Set $8 to 0 as if there are no error until after

bne $11,$0,divide                 # Check if Denominator is equal to zero
sll $0,$0,0                       # Delay

addiu $8,$0,1                     # Add 1 if Deno equal Zero
sw $8,12($10)                     # Store the error to memory from $8


#### Branch
divide:                           # Divison Branch

div $12,$11                       # Divide Numerator by the Denominator

mflo $11                          # Load the Ratio into $12
mfhi $12                          # Load the remainder into $11

sw $11,8($10)                     # $12 Store the Ratio to memory 
sw $12,4($10)                     # $11 Store the remainder to memory 

andi $5,$0,0                      # Clear register $5 X
sll $0,$0,0                       # No-op



# Data, Symbolic Addresses.
.data

x:  .word 1                       #0x0($10) X
remain: .word 0                   #0x4($10) remainder
ratio:  .word 0                   #0x8($10) Ratio         
error:  .word 0                   #0xC($10) Error cant divide by zero  


                                  #End Program