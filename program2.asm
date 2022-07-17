## CS 254 Program 2 Spring 2022
##

## CS 254 Program 2

## Compute 23*x

## Programmer: Giovanni Tshibangu
## Date: 2/23/2022

mian:
		ori $7,$0,1			# puts 1 in register $7
		addu $10,$0,$7			# Adds the value of register $7 and $0
		sll $7,$7,1 			# shifting 1 once  = 2
		addu $10,$10,$7			# Adds the value of register $7 and $10
		sll $7,$7,1  			# shifting 2 once  = 4
		addu $10,$10,$7			# Adds the value of register $7 and $10
		sll $7,$7,2 			# shifting 4 twice  = 16
		addu $10,$10,$7			# Adds the value of register $7 and $10

		


## End of file