Mengdi Wei: mwei6@ucsc.edu
LAB 6: VIGENERE CIPHER
Due Mar 11
01D Carlos Ramirez



• Describe what you learned, what was surprising, what worked well and what did not

    In this lab i learned that how to use subroutines which is very useful. And also i learned that
   how to do the virginia ciper. I didn't think this lab is too hard, but i did encount a lot of bugs
   which consume me a  lot of times. Like my decrypt method printed different results though i did it
   in a right way. Finall, i found it was because i didn't store the value correctly.
   
• Answer the following questions:
1. What additional test code did you write? Why? Did it work?

      I write test code for the DecryptChar and DecrypthString. And i also test other text and keys
     like text"Hellow World!" with key "GOODBYE"and "EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE". 
     with key "GOOD" and "Long" with key "SHORT". I test DecryptChar and DecryptString because there are no tests
     in the test_Lab6.asm. And i tested "Hello World!" because i wanted to know can my code word for symbols. I tested "E" more
     than 30 times to make sure my code could not print things after 30 chars. I tested "Long" with "SHORT" to make sure my code could
     end before read out the key.

2. What happens when you attempt encryption with a keystring that has illegal characters (for
example, “NotALegalKey”? Why?
    If the key is not legal. My code will print out other symbols instead of the alphabet i wanted.
       
     

3. How would you write a recursive subroutine (a subroutine that calls itself)?
           
      I will write a jal at the end of the subroutine to call itself. And also write a jump command to make the
    subroutine will be jump to other subroutines after the jal. And and some counter regiters in the subroutine
    everytime the subroutine call themselves. The counter will be incremented. And if the counter is incremented to the number
    i want, which means the loop will end. I will write jr $ra.(For example, if $t0 = 5, jr $ra)
      
      

4. According to MIPS calling conventions, arguments should be passed in the $a registers. There
are only 4 of these registers. What could you do to pass more than 4 arguments into a
subroutine?
      
      I could firstly store the first 4 arguments from $a in other registers. After that call this subroutine again, and then
     make $a registers read next arguments. And store them in other registers.
      
      
      
Magic number: ob1100
