## CS 254 Program 3
##
## Compute 5x^4 - 2x^3 + 12x^2 - 3x + 10 using Horner's Method
##
## Programmer: Giovanni Tshibangu
## Date: 2/27/2022


	.text
	.globl main

main:

		ori $16,$0,1 # Assign x= ? to 

		ori $23,$0,5 # Assign 5 to $23

		mult $23,$16 # Multiply $23 with X to $23

        
		mflo $23 # so we can discard upper 32 bits and only use lower 32 bits
        		 # stored by mult in lo register
        		 # move value from lo register to $23

		ori $8,$0,2  # Assigns 2 to $8

		subu $23,$23,$8	# Substract $8 from $23,  5x-2

		mult $23,$16	# Multiply $23 with X to $23, (5x-2)*x

		mflo $23 # move value from lo register to $23

		addiu $23,$23,12  # Adds $23 with 12,  5x^2 - 2x +12

		mult $23,$16 # Multiply $23 with X to $23, (5x^2-2x+12)*x

		mflo $23 #move value from lo register to $23

		ori $8,$0,3 # Assigns 3 to $8

		subu $23,$23,$8	# Substract $8 from $23,  (5x^3-2x^2+12x) -3

		mult $23,$16 # Multiply $23 with X to $23, (5x^3-2x^2+12x-3)*x

		mflo $23 #move value from lo register to $23

		andi $8,$0,0 # clear $8
		andi $16,$0,0 # clear $16 the value of X

		addiu $23,$23,10 # Adds $23 with 12,  (5x^4-2x^3+12x^2-3x) +10	




