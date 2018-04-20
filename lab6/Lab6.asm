## Mengdi Wei: mwei6@ucsc.edu
# LAB 6: VIGENERE CIPHER
# Due Mar 11
# 01D Carlos Ramirez


#Pseudocode:

#   EncryptChar
       
#        if s5 <- 0  (go to _CharInitialize)
#          move text in a0 to t0
#          move string in a1 to t1
#          change s5 to 1
          
#        if t0 is bigger than 'z'(if t0 is not alphabet, go to _EncryptCheck)
        
#         increment s0 <-s0 + 1
#         store t0 in $s2
#         increment s2<-s2 + 1
        
#       if t0 equals or is bigger than 'a'(if t0 is lowercase alphabet, go to _EncryptConvert)
         
#         substract 32 for t0 (change t0 to uppercase)
#         make $s3 = 1
        
#        if t0 is bigger than 'Z'(if t0 is not alphabet, go to _EncryptCheck)
        
#         increment s0 <-s0 + 1
#         store t0 in $s2
#         increment s2<-s2 + 1
                
#        if t0 is smaller than '@'(if t0 is not alphabet, go to _EncryptCheck)
        
#         increment s0 <-s0 + 1
#         store t0 in $s2
#         increment s2<-s2 + 1
         
#        Encrypt the char in t0 to t3
        
#        move t3 to v0
        
#        make s5 = 0
#        return
        
#   DecryptChar
       
#        if s5 <- 0  (go to _DecryptCharInitialize)
#          move text in a0 to t0
#          move string in a1 to t1
#          change s5 to 1
          
#        if t0 is bigger than 'z'(if t0 is not alphabet, go to _DecryptCheck)
        
#         increment s0 <-s0 + 1
#         store t0 in $s2
#         increment s2<-s2 + 1
        
#       if t0 equals or is bigger than 'a'(if t0 is lowercase alphabet, go to _DecryptConvert)
         
#         substract 32 for t0 (change t0 to uppercase)
#         make $s3 = 1
        
#       if t0 is bigger than 'Z'(if t0 is not alphabet, go to _DecryptCheck)
        
#         increment s0 <-s0 + 1
#         store t0 in $s2
#         increment s2<-s2 + 1
                
#        if t0 is smaller than '@'(if t0 is not alphabet, go to _DecryptCheck)
        
#         increment s0 <-s0 + 1
#         store t0 in $s2
#         increment s2<-s2 + 1
         
#        Decrypt the char in t0 to t3
        
#        move t3 to v0
        
#        make s5 = 0
#        return
        
#     EncryptString:
        
#         if t4 <- 0 (if it is the first loop, go to _EncryptStringInitialize)
#            save address of ra into sp
#            move the address in a0 to s0
#            move the address in a0 a1 to s1
#            move the address in a0 a2 to s2
#            substract 4 for sp
#            increment t4 <- t4 +1
            
#          load the first byte from s0 to t0(load plaintext)
#          load the first byte from s1 to t1(load key)
#          if t0 <- 0 (if t0 is null, go to _Return)
#              add s2 into a2
#              add 4 for sp
#              initialize s2 0
#              initialize s5 0
#              initialize s3 0
#              load word from sp to ra
#              return
              
#          if t4 <- 31 (if t0 is null, go to _Return)
#              add s2 into a2
#              add 4 for sp
#              initialize s2 0
#              initialize s5 0
#              initialize s3 0
#              load word from sp to ra
#              return
              
#          if t1 <- 0 (if t1 is null, go to _InitializeKey)
#             (read key from s1 again)
#             load the first byte from s1 to t1
             
#           initialize s3 0
#           initialize s5 1
#           call EncryptChar
#           if s3 <- 1 (t3 is lowercase, go to _EncryptReConvert)
#               add 32 for t3 (make t3 become lowercase) 
#               store t3 ih s2
#               increment 1 for t4
#               increment 1 for s2
#               increment 1 for s0
#               increment 1 for s1
#          else:
#               store t3 ih s2
#               increment 1 for t4
#               increment 1 for s2
#               increment 1 for s0
#               increment 1 for s1
          
#     DecryptString:
        
#         if t4 <- 0 (if it is the first loop, go to _DecryptStringInitialize)
#            save address of ra into sp
#            move the address in a0 to s0
#            move the address in a0 a1 to s1
#            move the address in a0 a2 to s2
#            substract 4 for sp
#            increment t4 <- t4 +1
            
#          load the first byte from s0 to t0(load plaintext)
#          load the first byte from s1 to t1(load key)
#          if t0 <- 0 (if t0 is null, go to _Return)
#              add s2 into a2
#              add 4 for sp
#              initialize s2 0
#              initialize s5 0
#              initialize s3 0
#              initialize t4 0
#              load word from sp to ra
#              return
              
#          if t4 <- 31 (if t0 is null, go to _Return)
#              add s2 into a2
#              add 4 for sp
#              initialize s2 0
#              initialize s5 0
#              initialize s3 0
#              initialize t4 0
#              load word from sp to ra
#              return
              
#          if t1 <- 0 (if t1 is null, go to _DecryptInitializeKey)
#             (read key from s1 again)
#             load the first byte from s1 to t1
             
#           initialize s3 0
#           initialize s5 1
#           call EncryptChar
#           if s3 <- 1 (t3 is lowercase, go to _DecryptReConvert)
#               add 32 for t3 (make t3 become lowercase) 
#               store t3 ih s2

#               increment 1 for t4
#               increment 1 for s2
#               increment 1 for s0
#               increment 1 for s1
#           else:
#               store t3 ih s2
#               increment 1 for t4
#               increment 1 for s2
#               increment 1 for s0
#               increment 1 for s1

#EncryptChar will Encrypt the char in t0 and move it to t3
.text
         li $s0,0 #s0 will store the address in $a0
         li $s1,0 #s1 will store the address in $a1
         li $s2,0 #s2 will store the result of EncryptString and DecryptString
         li $s3,0 #if letter is lowercase s3 will be 1, otherwise 0
         li $s5,0 #s5 will check whether  is the first time or not to enter EncryptChar and DecryptChar 
         li $t0,0 #t0 will store the byte of text
         li $t1,0 #t1 will store the byte of the key
         li $t3,0 #t3 will store the byte of the encrypt or decrypt result
         li $t4,0 #t4 is the counter for the loop
         li $sp,0 #so will store the address of $ra 
EncryptChar:		
        beq $s5,0,_CharInitialize #if s5 <- 0  (go to _CharInitialize)

 	bgt $t0,'z', _EncryptCheck #if t0 is bigger than 'z'(if t0 is not alphabet, go to _EncryptCheck)
        bge $t0,'a',_EncryptConvert #if t0 equals or is bigger than 'a'(if t0 is lowercase alphabet, go to _EncryptConvert)
        bgt $t0, 'Z',_EncryptCheck # if t0 is bigger than 'Z'(if t0 is not alphabet, go to _EncryptCheck)
        blt $t0, '@',_EncryptCheck # if t0 is less than '@'(if t0 is not alphabet, go to _EncryptCheck)
        
	add $t3,$t0,$t1 #  Encrypt the char in t0 to t3
	sub $t3,$t3,130 #  Encrypt the char in t0 to t3
	div $t3,$t3,26 #   Encrypt the char in t0 to t3
	mfhi $t3  #  move the remainder of t3/26 to t3
	add $t3,$t3,65 # add 65 for t3
        move $v0, $t3 # move t3 to v0
        li $s5,0  # initialize s5 = 0
        jr $ra  # return
     
    #_CharInitialize will make t0, t1 read char from a0 a1 and  increment s5
     _CharInitialize:
        move $t0, $a0 #move text in a0 to t0
        move $t1,$a1 #move key in a1 to t1
        addi $s5,$s5,1 #increment s5 to 1
        j EncryptChar # jump to EncryptChar
#DecryptChar will Decrypt the char in t0 and move it to t1        
DecryptChar:
        beq $s5,0,_DecryptCharInitialize # if s5 <- 0  (go to _DecryptCharInitialize)

 	bgt $t0,'z', _DecryptCheck   #if t0 is bigger than 'z'(if t0 is not alphabet, go to _DecryptCheck)
        bge $t0,'a',_DecryptConvert # if t0 equals or is bigger than 'a'(if t0 is lowercase alphabet, go to _DecryptConvert)
        bgt $t0, 'Z',_DecryptCheck # if t0 is bigger than 'z'(if t0 is not alphabet, go to _DecryptCheck)
        blt $t0, '@',_DecryptCheck #  if t0 is smaller than '@'(if t0 is not alphabet, go to _DecryptCheck)
        
       sub $t3,$t0,$t1 #  Decrypt the char in t0 to t3
       add $t3,$t3,26 #  Decrypt the char in t0 to t3
       div $t3,$t3,26 #  Decrypt the char in t0 to t3
       mfhi $t3 #  move the remainder of t3/26 to t3
       add $t3,$t3,65 # add 65 for t3
        move $v0, $t3 # move t3 to v0
        li $s5,0 # initialize s5 = 0
        jr $ra # return
    
     #_DecryptCharInitialize will make t0, t1 read char from a0 a1 and  increment s5
    _DecryptCharInitialize:
        move $t0, $a0 #move text in a0 to t0
        move $t1,$a1 #move key in a1 to t1
        addi $s5,$s5,1 #increment s5 to 1
        j DecryptChar #jump to DecryptChar
        
     #_EncryptStringInitialize will move address in a0 a1 a2 to s0 s1 s2     
    _EncryptStringInitialize:
         sw $ra, ($sp) #save address of ra into sp
        move $s0,$a0 #move the address in a0 to s0
         move $s1,$a1 #move the address in a0 a1 to s1
         move $s2,$a2 #move the address in a0 a2 to s2
         subi $sp, $sp, 4 #substract 4 for sp
         addi $t4,$t4,1 #increment t4 <- t4 +1
        J EncryptString #jump to EncryptString
 
 #EncryptString will Encrypt the text in a0 and move it to s0      
EncryptString:
        beq $t4,0,_EncryptStringInitialize #if t4 <- 0 (if it is the first loop, go to _EncryptStringInitialize
        lb $t0,($s0) # load the first byte from s0 to t0(load plaintext)
        lb $t1,($s1) # load the first byte from s1 to t1(load key)
        beq $t0,0,_Return # if t0 <- 0 (if t0 is null, go to _Return)
        beq $t4,31,_Return # if t4 <- 31 (if t4 is 31, go to _Return)
        beq $t1,0, _InitializeKey # if t1 <- 0 (if t1 is null, go to _InitializeKey)
        li $s3,0 #initialize s3 0
        li $s5,1 # initialize s5 1
        jal EncryptChar #  call EncryptChar
        beq $s3,1,_EncryptReConvert #  if s3 <- 1 (t3 is lowercase, go to _EncryptReConvert)	
	sb $t3, ($s2) # store t3 ih s2
	addi $t4,$t4,1 #increment 1 for t4
	addi $s2,$s2,1 #increment 1 for s2
        addi $s0,$s0,1 #increment 1 for s0
	addi $s1, $s1,1 #increment 1 for s1
	j EncryptString #jump to EncryptString
    
    #EncryptCheck will store symbols in s2
    _EncryptCheck:
        addi $s0,$s0,1 #increment s0 <-s0 + 1
        sb $t0, ($s2) #store t0 in $s2
	addi $s2,$s2,1 #increment s2<-s2 + 1
	j EncryptString #jump to EncryptString

    #EncryptConvert will convert the Lowercase letter to Uppercase		
   _EncryptConvert:
        sub $t0,$t0,32 # substract 32 for t0 (change t0 to uppercase)
      	li $s3,1 # make $s3 = 1
        j EncryptChar # jump to EncryptChar
   
    # _EncryptReConvert will convert the Uppercase letter to lowercase and store it in s2    
   _EncryptReConvert:
      add $t3,$t3,32 # add 32 for t3 (make t3 become lowercase) 
      li $s3,0	 # make s3 become 0
      sb $t3, ($s2) # store t3 ih s2
      addi $s2,$s2,1 # increment 1 for s2
      addi $s0,$s0,1 # increment 1 for s0
      addi $s1, $s1,1 # increment 1 for s1
      addi $t4,$t4,1 # increment 1 for t4
      j EncryptString # jump to EncryptString
   
    # _InitializeKey will make s1 read key from a1 again   
   _InitializeKey:
         move $s1,$a1 #(read key from s1 again)load the first byte from s1 to t1
        j EncryptString # jump back to EncryptString
        
   #_DecryptStringInitialize will move address in a0 a1 a2 to s0 s1 s2  
   _DecryptInitialize:
         sw $ra, ($sp) #save address of ra into sp
        move $s0,$a0 #move the address in a0 to s0
         move $s1,$a1 #move the address in a0 a1 to s1
         move $s2,$a2 #move the address in a0 a2 to s2
         subi $sp, $sp, 4 #substract 4 for sp
         addi $t4,$t4,1  #increment t4 <- t4 +1
        J DecryptString #jump to EncryptString
      
 #DecryptString will Encrypt the text in a0 and move it to s0       
DecryptString:
        beq $t4,0, _DecryptInitialize #if t4 <- 0 (if it is the first loop, go to _EncryptStringInitialize
        lb $t0,($s0) # load the first byte from s0 to t0(load plaintext)
        lb $t1,($s1) # load the first byte from s0 to t0(load plaintext)
        beq $t0,0, _Return # if t0 <- 0 (if t0 is null, go to _Return)
        beq $t4,31,_Return # if t4 <- 31 (if t4 is 31, go to _Return)
        beq $t1,0,_DecryptInitializeKey # if t1 <- 0 (if t1 is null, go to _InitializeKey)
        li $s3,0 #initialize s3 0
        li $s5,1 # initialize s5 1
        jal DecryptChar #  call DecryptChar
        beq $s3,1,_DecryptReConvert #  if s3 <- 1 (t3 is lowercase, go to _EncryptReConvert)	
         sb $t3, ($s2) # store t3 ih s2
	addi $s2,$s2,1 #increment 1 for s2
        addi $s0,$s0,1 #increment 1 for s0
	addi $s1, $s1,1 #increment 1 for s1
	addi $t4,$t4,1 #increment 1 for t4
	j DecryptString # jump to DecryptString
	
       #DecryptCheck will store symbols in s2
     _DecryptCheck:
        addi $s0,$s0,1 #increment s0 <-s0 + 1
	sb $t0, ($s2)  #store t0 in $s2
	addi $s2,$s2,1 #increment s2<-s2 + 1
	j DecryptString #jump to DecryptString

    #DecryptConvert will convert the Lowercase letter to Uppercase	
    _DecryptConvert:
        sub $t0,$t0,32 # substract 32 for t0 (change t0 to uppercase)
      	li $s3,1  # make $s3 = 1
        j DecryptChar # jump to DecryptChar
        
        # _DecryptInitializeKey will make s1 read key from a1 again   
    _DecryptInitializeKey:
        move $s1,$a1 #(read key from s1 again)load the first byte from s1 to t1
        j DecryptString # jump back to EncryptString
        
 # _DecryptReConvert will convert the Uppercase letter to lowercase and store it in s2  
   _DecryptReConvert:
      add $t3,$t3,32 # add 32 for t3 (make t3 become lowercase) 
      li $s3,0 # make s3 become 0
      sb $t3, ($s2) # store t3 ih s2
      addi $s2,$s2,1 # store t3 ih s2
      addi $s0,$s0,1 # increment 1 for s0
      addi $s1, $s1,1 # increment 1 for s1
       addi $t4,$t4,1 # increment 1 for t4
      j DecryptString # jump to EncryptString
   
   #_Return will move the address s2 to a2, initialize all $s register and return      
   _Return:
      add $a2,$a2, $s2  #add s2 into a2
      addi $sp, $sp, 4 #add 4 for sp
      li $s2,0 #initialize s2 0
      li $s5,0 #initialize s5 0
      li $s3,0 #initialize s5 0
      lw $ra,($sp) #load word from sp to ra
      li $t4,0 #initialize t4 0
      jr $ra # return
