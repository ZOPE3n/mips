# Mengdi Wei: mwei6@ucsc.edu
# Lab4: DEADBEEF in MIPS
# Due Feb 16
# 01D Carlos Ramirez

#In this program, i use the reminder of counter divides 4, counter divides 9 and sum of them to decide when to print "DEAD", "BEEF" or "DEEDBEEF"

.data
	#These are all the string to print
	prompt: .asciiz "Please enter a number N: "
	msg0: .asciiz  "DEADBEEF"
	msg1: .asciiz "DEAD"
	msg2: .asciiz "BEEF"
	msg3: .asciiz "\n"
.text 
	#These are all the number used in this code
	li $t0, 0 #$t0's value is always 0
	li $t1, 1 #$t1 is the counter in the loop
	li $t2, 0 #$t2 is tbe value of user's input
	li $t3, 4 #$t3's value is always 4 which is divided by $t1
	li $t4, 9 #$t4's value is always 9 which is divided by $t1
	li $t5, 0 #$t5 is the reminder of $t1 divides $t3
	li $t6, 0 #$t5 is the reminder of $t1 divides $t4
	li $t7, 0 #$t7 is the sum of $t5 and $t6 (sum of the reminder of $t3 and $t4) 
	li $t8, 0 #$t8's value is $t2's value+1, which makes the last number in the loop works6
	
 main:	
 	#print the messge to make user to make input
 	li $v0, 4 #when $vo is 4, syscall could print string in $a0
 	la $a0, prompt #make promt in $a0
 	syscall #print the string in $a0
 	
 	#user's input
 	li $v0, 5 #when $v0 is 5, it could let user to make input and move the value of the input into $v0
 	syscall #make user make input
 	
 	move $t2, $v0 #move value in v0 to $t2
 	addi $t8,$t2, 1 #make $t8's value one bigger than $t2
       
        # This is the loop in this program
 Loop:	
	beq $t1, $t8, Exit #when the $t1 equals $t8, the program will end
	
	div $t1,$t3 #$t1 divides $t3 
	mfhi  $t5 #move the reminder of $t1/$t3 from the HI register to $t5
	 
	div $t1,$t4 #$t1 divides $t4
	mfhi  $t6 #move the reminder of $t1/$t4 from the HI register to $t6
	 
	add  $t7,$t5,$t6 #$t7 equals $t5+$t6.
	
	#the sitaution when $t1 is the common multiple of 4 and 9
	li $v0, 4  #when $vo is 4, syscall could print string in $a0
	la $a0,msg0  #make msg0 in $a0
	beq $t7,$t0, PrintString #when $t7 equals $t0 (means $t1 is the common multiple of 4 and 9), use the PrintString function
	
	#the sitaution when $t1 is the multiple of 4
	la $a0,msg1 #make msg1 in $a0
	beq $t5,$t0, PrintString  #when $t5 equals $t0(means $t1 is the multiple of 4), use the PrintString function
	
	#the sitaution when $t1 is the multiple of 9
	la $a0,msg2 #make msg2 in $a0
	beq $t6,$t0, PrintString #when $t6 equals $t0(means $t1 is the multiple of 9), use the PrintString function
	
	#the sitaution when $t1 is the not a multiple of 4 or 9
	li $v0, 1 #when $vo is 1, syscall could print number in $a0
	la $a0, ($t1) #make the value of $t1 in $a0
	bne $t7, $t0, PrintNumber #when $t7 doesn't equals $t0(means $t1 is not a multiple of 4 or 9), use the PrintNumber function
	
	#This function could print string	
 PrintString:
	syscall #print the string
	
	addi $t1,$t1, 1 # $t1=$t1+1
	beq $t1, $t8, Exit #when the $t1 equals $t8, the program will end
	la $a0, msg3 #make msg2 in $a0
	syscall #print out the nextline
	
	j Loop #jump to the beginning of the loop
	
	#This function could print number	
PrintNumber:
	syscall #print the number 
	
	#this can make sure no extra space
	addi $t1,$t1, 1 # $t1=$t1+1
	beq $t1, $t8, Exit #when the $t1 equals $t8, the program will end
	
	#print the nextline
	li $v0, 4 #when $vo is 4, syscall could print string in $a0
	la $a0, msg3 #make msg2 in $a0
	syscall #print out the nextline
	
	j Loop #jump to the beginning of the loop
Exit: # end the program
