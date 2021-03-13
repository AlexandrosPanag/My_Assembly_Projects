#Alexandros_Panagiotakopoulos MIPS-Calculator!


# ­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­

.data
hdr: .ascii "\n\n!---> Project AM1716/16108 <---!\n\n\n"
.asciiz "Enter a menu value:\n>(1) For adding the numbers\n>(2) For subtracting the numbers\n>(3) For multiplying the numbers\n>(4) For dividing the numbers\n>(5) For exitting\n: "

hddr:
.asciiz "Enter the First Value : "

hdddr:
.asciiz "Enter the Second Value: "

ansMsg: .ascii "\n>The Result is: "
value: .word 0
# ­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­
                   #  text/code section
.text
.globl main
main:

#----------------------------------------------------------
#READING--AND--SAVING--THE--MENU--VALUE--------------------


loop:

li $v0, 4               # call code for print string
la $a0, hdr             # address of NULL terminated string
syscall                 # system call
li $v0, 5               # call code for read integer
syscall                 # system call (response in $v0)
move $t0,$v0            # saving the menu value in $t0 


#READING--AND--SAVING--THE--FIRST--VALUE------------------

beq $t0, 5, exit        #if the menu value == 5 exit the program
li $v0, 4               # call code for print string
la $a0, hddr            # address of NULL terminated string
syscall                 # system call
li $v0, 5               # call code for read integer
syscall                 # system call (response in $v0)
move $t1,$v0            # saving the first value in $t1

#READING--AND--SAVING--THE--SECOND--VALUE------------------
li $v0, 4               # call code for print string
la $a0, hdddr           # address of NULL terminated string
syscall                 # system call
li $v0, 5               # call code for read integer
syscall                 # system call (response in $v0)
move $t2, $v0           # saving the second value in $t2

#---------------------------------------------------------
#RESULT---------------------------------------------------

bne $t0, 1, else        # if the menu value !=1, jump to "else" label
add $t3, $t1, $t2       # result answer
j result                # jump to result

else:
     bne $t0, 2, elsee   # if the menu value !=2, jump to "elsee"
     sub $t3, $t1, $t2   # result answer
     j result            # jump to result
elsee:
     bne $t0, 3, elseee   # if the menu value !=3, jump to "elseee"
     mul $t3, $t1, $t2   # result answer
     j result            # jump to result
elseee:
     bne $t0, 4, exit   # if the menu value !=4, jump to "exit" 
     div $t3, $t1, $t2  # result answer
     j result           # jump to result

result:
                 sw $t3, value           # save to variable
                 li $v0, 4               # call code for print string
                 la $a0, ansMsg          # address of NULL terminated string
                 syscall                 # system call
                 li $v0, 1               # call code for print integer
                 lw $a0, value           # value for integer to be printed
                 syscall                 # system call
                 j loop                  #jump to loop                 

# ­­­­­----------------------------------------------------
#  Done, terminate program.

exit:
li $v0, 10              # call code for terminate
syscall                 # system call
.end main