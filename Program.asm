## CS 254 Program 1 Spring 2022
##
## Compute a + b + c + d
##
## Programmer: Giovanni Tshibangu
## Date: 2/13/2022

mian:
		ori $8,$0,0x4
		ori $9,$0,0x5
		ori $15,$0,0x6
		ori $11,$0,0x9

		addu $12,$9,$8
		addu $13,$11,$15

		addu $10,$13,$12


## End of file