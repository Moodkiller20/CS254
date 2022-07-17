## CS 254 Program 7
##
## Enter seed and how many random ints are desired
##
## Programmer: Giovanni Tshibangu
## Date: 03/31/2022
##

## Registers Used

# $t2 : store initial value 
# $t3 : No. of random to generate.
# $t0 : Counter
# $s1 : Value of A
# $s2 : Value of B
# $a1 : store 100
# $s0 : random value (rand)
 

             .text
             .globl main

main:   

li $v0,4
la $a0,init_Val_prompt            # Print prompt
syscall                           # Invoke the operating system.

li $v0,5                          # Read integer
syscall                           # Invoke the operating system. 
move $t2,$v0                      # Copy value into $t2


li $v0,4
la $a0,numberOfRand               # Print prompt
syscall                           # Invoke the operating system.

li $v0,5                          # Read integer
syscall                           # Invoke the operating system.
move $t3,$v0                      # Copy value into $t3

li $t0,0                          # Counter = 0
li $s1,21                         # a = 21
li $s2,53                         # b = 53

li $a1,100                        # $a1 = 100

move $s0,$t2                      # Copy value into $s0


################################ Branch
loop:
mul $s0,$s0,$s1                   # rand = rand *a 
add $s0,$s0,$s2                   # rand = (rand*a)+b
div $s0,$a1                       # rand = ((rand*a)+b) % 100
mfhi $s0                          # register Hi

move $a0,$s0                      # print random number
li $v0,1                          # print generated number
syscall                           # Invoke the operating system.


li $v0,11
li $a0,'\n'                       # New line after each random number
syscall                           # Invoke the operating system.

add $t0,$t0,1                     # Increment the counter
blt $t0,$t3,loop                  # Branch to loop if condition met.


li $v0,4
la $a0,done                       # Print prompt
syscall                           # Invoke the operating system.


# Data, Symbolic Addresses.
.data

init_Val_prompt: .asciiz "Initial value :"
numberOfRand: .asciiz "Enter how many:"
done: .asciiz "Done"

                                  # End Program