## CS 254 Program 8
##
## Determine if user-entered number is a perfect number.
##
## Programmer:Giovanni Tshibangu
## Date:4/14/2022
##


    ## Registers Used
    # $t1 counter
    # $t2 contain value of N
    # $t3 Value of the remainder
    # $t4 Sum of divisors
  
             .text
             .globl main

main:   

li $v0,4                   
la $a0,request                   # print string
syscall                          # Invoke the OS

li $v0,5                          # Read integer
syscall                           # Invoke the operating system. 
move $t2,$v0                      # Copy the number into $t2

ori $t1,$0,1                      # Initialize the counter  
ori $t4,$0,0                      # Initialize Sum

# Loop  ############################## Branch  ######################
loop:
beq $t2,$t1,done                  # Check if count == N to end the Loop
sll $0,$0,0                       # Delay Slot


div $t2,$t1                       # N/i i = counter
mfhi $t3                          # Set $t3 to remainder

beq $t3,$0,addToSum               # check if remainder is == 0, branch
sll $0,$0,0                       # Delay Slot

# AddToSum ############################## Branch  ######################
addToSum:                         
add $t4,$t4,$t1                   # sum up N divisors
beq $t4,$t2,isPerfect             # Check if Sum == N then branch
sll $0,$0,0                       # delay slot
addiu $t1,$t1,1                   # count++
j loop                            # Branch Loop
sll $0,$0,0                       # Delay Slot

# isPerfect ############################## Branch  ######################
isPerfect:
move $a0,$t2                      # copy N to $a0 to print
li $v0,1                          # Print integer
syscall                           # Invoke OS
li $v0,4
la $a0,responseTrue               # Print String
syscall                           # Invoke OS
sll $0,$0,0                       # Delay Slot

# Done  ############################## Branch  ######################
done:
bne $t4,$t2,NotPerfect            # sum != branch
sll $0,$0,0                       # Delay Slot
li $v0,10                         # Quit Program.
syscall                           # Invoke OS

# NotPerfet  ############################## Branch  ######################
NotPerfect:

li $v0,11
li $a0,'\n'                       # New line after each random number
syscall                           # Invoke OS
move $a0,$t2                      # copy N to $a0 to print
li $v0,1                          # Print integer
syscall                           # Invoke OS
li $v0,4   
la $a0,responseFalse              # Print String
syscall                           # Invoke OS
sll $0,$0,0                       # Delay Slot

li $v0,10                         # Quit Program
syscall                           # Invoke OS



# Data, Symbolic Addresses.
.data

# String variables 

request: .asciiz "Enter number :"
responseTrue: .asciiz " is perfect!"
responseFalse: .asciiz " is Not perfect!"




                                  # End Program