## Mengdi Wei: mwei6@ucsc.edu
# LAB 5: DECIMAL TO BINARY CONVERTER
# Due Mar 2
# 01D Carlos Ramirez

#Pseudocode:
#store argument address in $t0
#store arguments byte in t1

#get the first char from program arguments
#if the first char is '-'
#   do s6 <- 1
#else
#   do s6 <- 1

#countnumber in the program argument
#while the loaded byte(t0) != 0
#   t2 <- 1 * 10
#   increment the counter for loop
#   t0 <- t0+ 1
#   go back to while loop beginning

#storeNumber in s0
#while the loaded byte(t0) != 0
#   t4 <- t1+-48 (change the char number to integer in t1)
#   increment the couter for loop
#    t0 <- t0 + 1
#    s0 <- t4 + s2
#    s2 <- s2/10
#    go back to loop beginning
 
#if the number is postive   
#   Print out the prompt and user input
#if the number is negative
#   print out the prompt 
#  multiply the user input -1
# print the negative number
# s2<-s0
#convertToBinary
#  while the qotient t7 is not equal to 1
#  s2 divide 2
#  t8 <- remainder
#  t7 <0 qotient
#  s2 <- t7 
#  myarray(t4) <-t8
#  t8 <-t8+1
#  t4 <-t4+4
#  go back to loop begining
  
#save the last qotient intio myArray(t4)
#   myarray(t4) <- t7
   
# addZero
#  while t4 != 128
#    myarray(t4) <- 0
#    t4 <= t4+4
#    go back to loop begining

# determineNegative
   
#   if s6 = 1
#     go to NegativeReverse
#   else
#     go to PositiveReverse
     
# PostiveReverse
   
#    while t4 >0 
      
#      myArray(t4) <- t6
#      t4 <- t4+4
#      binary(t3) <- t6
      
#    jump back to loop begining

# NegativeReverse

#      while t4 >0 
      
#       myArray(t4) <- t6
#       t4 <- t4-4
#       if t6 = 0
#        go to changeZero
#       t6 <- 0
#       binary(t3) <- t6
#       t3 <- t3+4
       
#       go back to while
       
# changeZero

#    t6 <- 1
#    binary <- t6
#    t3 <-t3+4
#    go back to NegativeReverse loop begining
    
# twosComplement
     
#      while t3 != 0
#       binary <- t6
#       t6 <- t6+1
#       if t6 = 2
#         go to changeOne
#       binary <- t6
#       if t6 != 2
#        go to output
#       t3 <- t3
#       go back loop begining
       
# changeOne
#       t6 <- 0
#       binary(t3) <- t6
#       t3 <- t3+4
#       go back to twosComplement loop begining
       
# output
#    printout the output prompt message
#    printout the binary number
       
#    exit the programstore argument address in t0

.data
    myArray: .word 0:32 #myArray is a array to store the reversed binary number
    binary:  .word 0:32 #binary is a array to store the correct order binary number
    prompt: .asciiz "User input number: " 
    Output: .asciiz "This number in binary is:" 
    newline: .asciiz "\n"
    number: .asciiz "110"
.text
     #$a1 store the program argument address
     li $s0,0 #s0 store the integer number of program argument
     li $s2,0 #s2 store the copy of the value of $s0
     li $s5,2 #s5 is the number to be divided by $s0 which store the integer number user inputted
     li $s6,0 #if the number is postive $s6 is 0, else $s6 is 1
     li $t0,0 #$t0 is the input string address
     li $t1,0 #$t1 is the nth byte number from program argument
     li $t2,1 #$t2 is 10^n, which is used to mutiply integer from the argumen to be stored in $s0
     li $t3,0 #$t3 is the result of  integer from $t0 multiply $t2 which is 10^n. And it also be used for count to array
     li $t4,'-' #$t4 is the mineus symbol, which is used to detect the first byte of the program argument
     li $t6, 0 #t6 is one of the register which load the byte from program arguments
     li $t7,9 #$t7 is the quotiant of $s0 divide $s5  
     li $t8,0 #$t8 is the reminder of $s0 divide $s5  
     
#checkFirstByte will check if the number in the argument is the negative number or not
checkFirstByte:
      lw $t0,($a1) #load the argument address from $a1
      lb $t1,($t0) #load the fist byte from the program argument
   
      beq $t1,$t4,changeSign #if the the first byte is '-' go  to changeSign
      j increment # go to increment 
#changeSign will change the $s6 register to 1 if the number is negative
changeSign: 
      li $s6,1 # if the argument number is negative,$s6 = 1, else $s6 =0
      addi $t0,$t0,1 #increment the $t0, then we gan get next byte of program argument
#increment will increment $t0 to get the next byte of argument
increment:
     addi $t0,$t0,1 # #increment the $t0, then we gan get next byte of program argument
#count will count the all byte of     
count:  
      lb $t1,($t0) # load the byte from the argument(the nth byte after increment n times $t0) 
      beqz $t1,initialize #if $t1 =0, go to initialize
      mul $t2,$t2,10 # let $t2 mutiply 10
         li $v0, 1 #when $vo =1, print out the integer
   la $a0, ($t2) #move move $t6 to $a0
   syscall #print out the integer
      addi $t0,$t0,1 # increment $t0 to get the next byte of argument
      j count #jump back to count
#initialize the $t0 and $t1
initialize:
      lw $t0,($a1) #load the argument address from $a1
      lb $t1,($t0) #load the fist byte from the program argument
      beq $t1,$t4,addOne #if the first byte is '-' got to addOne         
      j storeNumber #jump to storeNumber
#increment the $t0 to get the next byte if argument
addOne:
      add $t0,$t0,1 #increment the $t0, then we gan get next byte of program argument

#make the number on the argument store in the program register $s0
storeNumber:
      lb $t1,($t0) #get the digit from $t0
      addi $t4,$t1,-48 #change the char digit in $t0 to integer

      
      beqz $t1,Print_prompt #when get null char go to Print-prompt
      addi $t0,$t0,1 #increment $t0 to get next byte of argument
      mul $t3,$t2,$t4 #$t3 is the result of  integer from $t0 multiply $t2 which is 10^n
      add $s0,$s0,$t3 #stoer the number in $s0
      div $t2,$t2, 10 #divid $t2 10
       j storeNumber #jump back to storeNumber
#print out the user input infomation       
 Print_prompt:
      #print the string in prompt
      li $v0,4 #when $vo =4, print out the string
      la $a0,prompt #move prompt to $a0 register
      syscall #print the string
      
      #print the newline(change to nextline)
      li $v0,4 #when $vo =4, print out the string
      la $a0, newline #move newline to $a0 
      syscall #print the string
      move $s2,$s0
      beq $s6,1,NegativePrint #if the $s6 is 1, whcich means the number is negative, go to NegativePrint
      
      #print out the integer in $s0
      li $v0,1 #when $vo =1, print out the integer
      la $a0, ($s0) #move $s0 to $a0 register
      syscall #print the integer in $s0
      
      #print out the 
      li $v0,4 #when $vo =4, print out the string
      la $a0, newline #move newline to $a0 
      syscall #print the string
      
      li $t4,0 #initialize the $t4 to $t0
      j convertToBinary #jump to convertToBinary
#when the number is negative print the negative number
NegativePrint:
      mul $s0,$s0,-1
 
      li $v0,1 #when $vo =1, print out the integer
      la $a0, ($s0) #move $s0 to $a0 register
      syscall #print the integer in $s0
      
      #print the newline(change to nextline)
      li $v0,4 #when $vo =4, print out the string
      la $a0, newline #move newline to $a0 
      syscall #print the string
      
      li $t4,0 #intialize $t4 to 0
     
#conver the decimal number in $s0 to binary number      
convertToBinary:
     beq $t7, 0, subNumber #if the quotient of the division is 1, go to addZero

     div $s2, $s5 # $s0 divide $s5 which is 2
     mfhi $t8 #make $t8 bacome the remaider of after $s0 divide 2
     mflo $t7 #make the $t7 become the quotient of the division
     move $s2,$t7 #move the value in $t7 in $s0

     sw $t8, myArray($t4) #save the remainder into the myArray($t4)
     addi $t4,$t4,4 #increment 4 for $t4
     j convertToBinary
#decrement 4 for $t4 to make count number correct
subNumber:
      addi $t4, $t4,4#decrement 4 for $t4 

#fill the zero in the rest digits of 32 digits in the array
addZero:
      beq  $t4,128,determineNegative #if $t4 is the last digit of the array, go to the determineNegative
      sw $s7, myArray($t4) #save the $s7 into myArray
      
      addi $t4,$t4,4 #increment 4 for $t4 
            
      j addZero #jump back to addZero
      
#if the number is negative go to NegativeReverse, else go to postive reverse
determineNegative:  

     li $t3,0 #intialize #t3 to 0
     sub $t4,$t4,4 #decrement 4 for #t4
     beq $s6,1,NegativeReverse #if $s6 =1, the number is negative, then go to NegativeReverse
     j PostiveReverse #if $s6 is not equal, go to PostiveReverse
      
#if the number is postive number, reverse the number in the array
PostiveReverse:
      blt $t4,0,output #if $t4 is less than 0, go to output

      lw $t6, myArray($t4) #load the digit from myArray() into $t6
      sub $t4, $t4, 4 #decrement 4 for $t4 
      sw $t6,binary($t3) #save the digit $t6 in in binary()
      addi $t3,$t3,4 #increment 4 fot $t3

      j PostiveReverse #jump back to PostiveReverse
      
#if the number is postive number, reverse the number in the array, and change 0 to 1, 1 to 0   
NegativeReverse:
      blt $t4,0,subNumbers #if $t4 is less than 0, go to subs

      lw $t6, myArray($t4) #load the digit from myArray() into $t6
      sub $t4,$t4,4 #decrement 4 for $t4 
      beq $t6, 0,changeZero #if $t6 is 0, go to changeZero
      li $t6,0 #initialize $t6 to 0
      sw $t6,binary($t3) #save $t6 into binary($t3)

      addi $t3,$t3,4 #increment 4 for $t3
      j NegativeReverse #jump to NegativeReverse

#change 0 to 1
changeZero:
      li $t6,1 #intiallize $t6 to 1
      sw $t6,binary($t3) #save the $t6 into binary()
      addi $t3,$t3,4  #increment 4 for $t3 
      j NegativeReverse #jump back to NegativeReverse
      
#sub 4 for $t3 to make the count number correct
subNumbers:
      sub $t3, $t3,4 #sub 4 for $t3

#make the form of the binary number in array become two's complement form     
twosComplement:
   beq  $t3,0,output #if $t3 is 0, go to output
   lw $t6, binary($t3) #load the word from binary to $t6
   addi $t6,$t6,1 # increment 1 for $t6 to check whether this digit is 1 or not
   beq $t6,2,changeOne #if $t6 is 2, then carry 1, so go to changeDigit
   sw $t6, binary($t3) #save $t6 in binary

   bne $t6,2,output #if $t6 is not equal to 2, go to outpur
   sub $t3,$t3,4 #sub 4 for $t3
   j twosComplement #jump back to twoscomplement

#change 1 to 0
changeOne:            
   li $t6,0 #initialize $t6 to 0
   sw $t6,binary($t3) #save $t6 into binary
   sub $t3,$t3,4 #decrement 4 for $t3
   j twosComplement #jump back to twosComplement
 
#print out the output information
output:
   
   li $v0,4 #when $vo =4, print out the string
   la $a0,Output  #move Output to $a0 register
   syscall #print out the Output
   
   li $v0,4 #when $vo =4, print out the string
   la $a0,newline #move newline to $a0 register
   syscall #print out the Output
   
   li $t4,0 #initialize $t4 to 0

#print out the binary number which is converted from the decimal number
printBinary:
   beq $t4,128,exit #if $t4 is 128, go to exit
   lw $t6,binary($t4) #load number in binary into $t6
   addi, $t4,$t4,4 #increment 4 for $t4
   
   li $v0, 1 #when $vo =1, print out the integer
   la $a0, ($t6) #move move $t6 to $a0
   syscall #print out the integer
   j printBinary #jump back to printBinary
   
#exit the program      
exit:
   
    li $v0, 10 #when $v0 = 10, stop the program
    syscall   #stop the program   

