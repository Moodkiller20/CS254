## CS 254 Program 11
##
## Find the largest of four integers.
##
## Programmer: Giovanni Tshibangu
## Date: 5/6/2022
##
## Register use table:

## $s0 - $s3 hold 1st value  to 4th Value entered by the user
## $a0 - $a3 hold 1st argument  to 4th argument
## $t0 - hold value entered by the user at prompt

## $t0 - Hold temp Max value
## $t1 - Hold temp Min value


   .text
.globl main

main:

jal pread                         # read 1st integer
nop                               # branch delay slot
move $s0, $v0                     # Save it

jal pread                         # read 2nd integer
nop                               # branch delay slot
move $s1, $v0                     # Save it

jal pread                         # read 3rd integer
nop                               # branch delay slot
move $s2, $v0                     # Save it

jal pread                         # read 4th integer
nop                               # branch delay slot
move $s3, $v0                     # Save it

move $a0, $s0                     # First  arguement 
move $a1, $s1                     # Second arguement 2
move $a2, $s2                     # Third  arguement 3
move $a3, $s3                     # Fourth arguement 4

jal find_min_max                  # Jump to label
nop                               # branch delay slot
move $s0, $v0                     # copy max value
move $s1, $v1                     # copy min value


li $v0, 4                         # Prompt Max Value
la $a0, max_num                   # Print max value
syscall                           # Invoke the OS

li $v0, 1                         # Print max Value
move $a0, $s0                     
syscall                           # Invoke the OS

li $v0, 10                        # End Program (exit)
syscall                           # Invoke the OS

################ Returning values
move $v1, $v0
move $v0, $t0
  
jr $ra                            # return 

################################ Branch

find_min_max:
move $t0, $a0                     # Considering max
move $t1, $a0                     # Considering min

bgt $t0,$a1, secondGreatNumber
move $t0, $a1

################################ Branch
secondGreatNumber:
bgt $t0,$a2, thirdGreatNumber     # Branch if greater than
move $t0, $a2

################################ Branch
thirdGreatNumber:
bgt $t0,$a3, lessThan             # Branch if greater than   
move $t0, $a3 

################################ Branch                    
lessThan:
ble $t1,$a1, secondSmall         # Branch if less than
move $t1, $a1

################################ Branch 
secondSmall:
ble $t1,$a2, thirdSmall          # Branch if less than
move $t1, $a2

################################ Branch 
thirdSmall:
ble $t1,$a3, finalReturn         # Branch if less than
move $t0, $a3

################################ Branch Final 
finalReturn:

move $v0, $t0                     # Copy Value $v0 to $t0
move $v1, $t1                     # Return 

jr $ra                            # Jump to register $ra


# Symbolic Addresses. 
  .data

max_num: .asciiz "The largest integer is "


