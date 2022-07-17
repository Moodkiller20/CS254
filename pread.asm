## CS 254 Program 11
##
## Find the largest of four integers.
##
## Programmer: Giovanni Tshibangu
## Date: 5/6/2022
##
# pread.asm -- prompt for and read an integer
#
## Register use table:
# on entry:
# $ra -- return address
#
# on exit:
# $v0 -- the integer


.text
 .globl pread
 

pread:

la $a0,prompt                     # print string
li $v0,4                          # service 4 syscall
syscall                           # Invoke the OS

li $v0,5                          # read int into $v0 syscall # service 5
syscall                           # Invoke the OS


jr $ra                            # return
nop                               # branch delay slot



# Symbolic Addresses. 
 .data

prompt:
.asciiz "Enter an integer: "