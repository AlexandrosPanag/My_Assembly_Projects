#Alexandros_Panagiotakopoulos 


# ­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­

.data
text: .ascii "\n Hello world ! \n"         #this is a comment



# ­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­
                   #  Main Section
.text
.globl main
main:


li $v0, 4               # Assembly code to print out the string
la $a0, text            # Printing the string command
syscall                 # Making a system call

# ­­­­­----------------------------------------------------
#  Done, terminate program.

exit:
li $v0, 10              # Termination code ( Optional )
syscall                 
.end main