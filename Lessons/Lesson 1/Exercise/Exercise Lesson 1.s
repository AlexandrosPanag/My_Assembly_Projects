# The code was written by Alexandros Panagiotakopoulos 
# For the Hellenic Mediterranean University (HMU)
# Summer Semester
# Date 07/03/2025
# LICENSE: MIT

# Try to solve in MIPS Assembly the following mathematic formula:
# result = A+B-C


# 1) We Open QtSpim (with the computer icon)
# 2) We Click File -> Load File
# 3) We load the exercise either in .txt format or .s
# 4) We ensure that the Window -> Console runs at the same time as the QtSpim program.
# 5) We press run/continue on the green play button
# 6) the result appears on our Console from the other tab.
# 7) Once our program is over we press Reinitialize Simulation (the left hashtag icon next to Run/Continue) Green Play Button
# 8) We go back to step 2 !!!




# We need to break it down!!! And solve everything step-by-step
# first we need to solve A+B= y, NOTE: Y is the result of A+B
# then, once it is solved, we need to change the formula to: result = Y - C
# lastly, we need to output the result!
# For easier implementation, assume that A=5, B=8, C=6 

# <-- NOTE: The HASHTAG is for making comments in our code! 

# If we did everything correctly, our output must be 5+8=13
# Then 13-6=7, where 7 will be the output!

.text
.globl main

main: #remember how similar it is to int main from C!


    # Load immediate values into registers - we declare our variables!
    li $t0, 5    # Load the value 5 into register $t0 (A=5)
    li $t1, 8   # Load the value 10 into register $t1 (B=8)
    li $t2, 6   # Load the value 10 into register $t2 (C=6)
	



    # Add the two numbers and store the result in register $t3 (basically, we solve Y=A+B)
    add $t3, $t0, $t1 #(We solve Y= A + B) 
	

    # Then, we need to subtract the Y-C and store into a new value!	
    sub $t4, $t3, $t2 # (We solve RESULT= Y - C <=> result A+B-C)
    




    # Print the result
    move $a0, $t4   # Move the result to $a0 (argument register for syscall)


    li $v0, 1       # Load the print integer syscall code into $v0
    syscall         # Make the syscall to print the integer

    # Exit the program
    li $v0, 10      # Load the exit syscall code into $v0
    syscall         # Make the syscall to exit the program