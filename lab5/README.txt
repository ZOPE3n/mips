Mengdi Wei: mwei6@ucsc.edu
LAB 5: DECIMAL TO BINARY CONVERTER
Due Mar 2
01D Carlos Ramirez

1. Describe what you learned, what was surprising, what worked well and what did not

  In this lab i learned how to use MIPS assembly language to code more deeply in MARS. I am surprising that how the 
program work in the memory. Especially, i am surpriing that to get the argument number to use $a1. I think it is amazing
to use address in memory to get numbers. I work well on the convert decimal to binary part. But i can't do well in the 
input part. To get the input from program arguments is a little difficult for me. I work for a lot of time to get the correct number
from $a0.  
  
2. What happens if the user inputs a number that is too large to fit in a 32-bit 2SC number?

      when i input a number that is too large the mars will show that my input number is 0. And it print out the
      binary number is also 00000000000000000000000000000000.

3. What happens if the user inputs a number that is too small (large magnitude, but negative) to fit
in a 32-bit 2SC number?
       when i input a number that is too samll the mars will show that my input number is -0. And it print out the
      binary number is 10000000000000000000000000000000.
        
4. What is the difference between the “mult” and the “multu” instructions? Which one did you
use, and why?

      mult is the multiplication and multu is the multiplication unsighned. I didn't use any one of them. Because
      i need to use 'mul' which is multiplication without overflow to make the situaion of overflow not happen.
   
   
5. Consider how you might write a binary-to-decimal converter, in which the user inputs a string of
ASCII “0”s and “1”s and your code prints an equivalent decimal string. How would you write your
code? How is the BDC like the DBC, and how is it different?

       I will firstly change the binary number ASCII to integer and store them in a register. And change the method of div 2 which
    is used to convert decimal to binary into mul 2. I mean reverse the way i convert decimal to binary. For example, if the input is
    110 i will make 0*2^0+1*2+1*2^2 and same them in a register. And also i will check the negative number.
    If the first byte number is 1, which means the number is negative, i will change the binary number to positive form
    Then i will multiply the decimal number to -1 after converting. I think the same thing between BDC and the
    DBC is they all use the same way to read the address from the arguments. And it all use same way to print out and save value. The different thing is DBC need to
    use div 2 to be change Decimal to binary. However, BDC need mul 2. And also DBC need to check '-' in argument to whther the number is negative
    or not. However, the BDC just need to check the '1' and '0'.
      
      

 Magic number: 0b1010,0x0745,0123  