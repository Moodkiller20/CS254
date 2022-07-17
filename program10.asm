## CS 254 Program 
##
## Compute sin(x) with a Taylor series:
##
## Programmer: Giovanni Tshibangu
## Date: 4/28/2022
##

## Registers Used

## $t0 value of n
## $f5 (Series*x^2)/(n(n-1))
## $f1 absolute value of (x^2)/(n(n-1))
## $f2 holds x^2
## $f3 holds remainders +or-(x^2)/(n(n-1))
## $f4 accuracy
## $f12 Holds sin(x)

 

             .text
             .globl main

main:   


li $t0,3                          # Counter n = 3

li.s $f4,1.0e-6                   # Set Accuracey

li $v0,4                          # syscall for Print String
la $a0, prompt                    # load address of prompt
syscall                           # Invoke the OS

li $v0,6                          # Reads float value
syscall                           # Invoke the OS

mov.s $f5, $f0                    # Copy X to $f5
mul.s $f2,$f5,$f5                 # x^2

mov.s $f12,$f5                    # Copy $f5 to $f12

################################ LoopFor Branch
LoopFor:

abs.s $f1,$f5                     # compares to the non-negative value of the series

c.lt.s $f1,$f4                    # is number < 1.0e-6?

bc1t endLoop                      # Branch to endFor

subu $t1,$t0,1                    # (n-1)
mul $t1,$t1,$t0                   # n(n-1)
mtc1 $t1, $f3                     # move n(n-1) to a floating register
cvt.s.w $f3, $f3                  # converts n(n-1) to a float
div.s $f3,$f2,$f3                 # (x^2)/(n(n-1))
neg.s $f3,$f3                     # -(x^2)/(n(n-1))
mul.s $f5,$f5,$f3                 # (Series*x^2)/(n(n-1))

add.s $f12,$f12,$f5               # Move $f5 to $f12

addu $t0,$t0,2                    # counter n+=2


b LoopFor                         # branch to the LoopFor


################################ endLoop Branch
endLoop:

li $v0,2                          # Prints
syscall                           # Invoke the OS

###### House Keeping  ######################

andi $t0,$0,0                     # Clear register $t0
andi $t1,$0,0                     # Clear register $t1


li $v0,10                         # End Program
syscall                           # Invoke the OS


# Symbolic Addresses. 
.data
prompt: .asciiz "Enter x: "