## CS 254 Program 6 Spring 2022
##

## Compute the sum of the odd integers and the sum of even integers

## Programmer: Giovanni Tshibangu
## Date: 03/26/2022



    ## Registers Used
    # $5 is used for N- integers
    # $6 is used for the sum of even numbers
    # $7 is used for the sum of odd numbers
    # $8 is used as a counter variable 
    # $10 is used as the base register
    # $12 stores 2 for division
    # $15 is used to store the remainder from div


             .text
             .globl main

main: 

lui $10,0x1000                    # Base register - 
lw $5, 0($10)                     # Initialize N
lw $6, 4($10)                     # Initialize evensum
lw $7, 8($10)                     # Initialize oddsum

ori $8,$0,0                       # counter = 0 

addiu $5,$5,1                     # Adding 1 to N for N to be inclusive while count == N

# Finish  ############################## Branch  ######################
# while  count == N
loop: beq $8,$5,done              # Loop while $8 (counter) is not equal to $5(N-integer)
sll $0,$0,0                       # Delay slot    

# check if N is odd or even
ori $12,$0,2                      # Load 2 in register $12  
div $8,$12                        # Divide $8(Counter) by $12 (2) 
mfhi $15                          # Load remainder into $15

beq $15,$0,even                   # if $15 equal zero jump to even. Even number do not have remainder when divided by 2.
sll $0,$0,0                       # Delay Slot

bne $15,$0,odd                    # if $15 not equal to zero jump to odd. Odd number have remainder when divided by 2
sll $0,$0,0                       # Delay Slot

# Finish  ############################## Branch  ######################
# Even branch Operation
even: addu $6,$8,$6               # Add even value to the evensum variable.
j ifend                           # Jump to the counter and increment by 1

sll $0,$0,0                       # Delay Slot

# Finish  ############################## Branch  ######################
# Odd branch Operation
odd: addu $7,$7,$8                #Add odd value to the oddsum variable.

# Finish  ############################## Branch  ######################
ifend:   addiu    $8,$8,1        # counter++
         j        loop           # Jump back to Loop(Branch)
         sll      $0,$0,0        # branch delay

# Finish  ############################## Branch  ######################
done: sll $0,$0,0                # target for branch.

# Clearing Registers ############################## House Keeping  ######################
andi $5,$0,0                     # Clear register $5 N
andi $12,$0,0                    # Clear register $12 
andi $4,$0,0                     # Clear register $4
andi $8,$0,0                     # Clear register counter($8)
sll $0,$0,0                      # No-op



# Data, Symbolic Addresses.
.data

N:       .word 4                 # 0x0($10) N
evensum: .word 0                 # 0x4($10) evensum
oddsum:  .word 0                 # 0x8($10) oddsum         



                                #End Program