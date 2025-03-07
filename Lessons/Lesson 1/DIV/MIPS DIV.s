# Alexandros Panagiotakopoulos - alexandrospanag.github.io
# Date 07/03/2025

.text
.globl main

main:
    # Load immediate values into registers
    li $t0, 10   # Load the value 10 into register $t0
    li $t1, 5    # Load the value 5 into register $t1

    # Divide the first number by the second and store the quotient in register $t2
    div $t0, $t1
    mflo $t2     # Move the quotient from the LO register to $t2

    # Print the result
    move $a0, $t2   # Move the result to $a0 (argument register for syscall)
    li $v0, 1       # Load the print integer syscall code into $v0
    syscall         # Make the syscall to print the integer

    # Exit the program
    li $v0, 10      # Load the exit syscall code into $v0
    syscall         # Make the syscall to exit the program