## CS 254 Program 4 Spring 2022
##

## Compute (13x - 4xy + 18)/7

## Programmer: Giovanni Tshibangu
## Date: 03/6/2022

# registers to be used: $4, $8, $9, $10, $11

              .text
              .globl main

main: 

lui, $10, 0x1000                  # Setting up the base at $10
lw $8,0($10)                      # Load X into $8

                                  # load y in $9
lw $9, 4($10)                     # $9 = value of y

addiu $11,$0,13                   # adding 13 to $11
mult $11,$8                       # 13 times X
mflo $11                     

ori $4,$0,4                       # 4 to $4
mult $4,$8                        # 4 times X
mflo $4
mult $4,$9                        # 4x times Y
mflo $4

subu $11,$11,$4                   # 13x-4xy
andi $4,$0,0                      # clear $4           

addiu $11,$11,18                  #(13x-4xy+18)

addi $4, $0, 7                    # $4 = 7
div $11, $4                       #(13x-4xy+18)/7

                                  # quotient stored in lo
mflo $9                           # $9 = quotient

                                  # remainder stored in hi
mfhi $8                           # $8 = remainder

andi $4,$0,0                      # clear $4

                                  # store values to memory
sw $9, 8($10)                     # answer = quotient
sw $8, 12($10)                    # remainder = remainder value

lw $a0, 12($10)

	.data

x: .word 1                        # use address 0x10000000
y: .word 1 		    			  # next address is 0x10000004

answer:       .word 0      		  # at 0x10000008
remainder:   .word 0       		  # at 0x1000000c


                                  # end program					


