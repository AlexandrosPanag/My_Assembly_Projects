#Alexandros_Panagiotakopoulos 

# for ($t0 =5; $t0 > 0; $t0 = $t0 -1)  

# ­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­

.data
text: .ascii         



# ­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­
                   #  Main Section
.text
.globl main
main:

li $a0, 0         # $a0 = 0

li $t0, 5       # Initialize loop counter to 5

loop:  

add $a0, $a0, $t0  #counter add

addi $t0, $t0, -1      # Decrement loop counter  

bgtz $t0, loop         # If ($t0 > 0) Branch to loop


# ­­­­­----------------------------------------------------
#  Done, terminate program.

exit:
li $v0, 10              # Termination code ( Optional )
syscall                 
.end main