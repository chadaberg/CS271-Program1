TITLE Elementary Arithmetic (Program1.asm)
;Author: Chad Berg
;CS 271 Program 1 9/30/2018
;Description: This Program gets two integers from the user, calculates the Sum, Difference, product, quotient, 
;   and remainder, then outputs the results.

INCLUDE Irvine32.inc

.data
StartText BYTE "Elementary Arithmetic by Chad Berg",0
InstructText BYTE "Enter 2 numbers, and I'll show you the sum, difference, product, quotient, and remainder.",0
FirstNumText BYTE "First Number: ",0
SecondNumText BYTE "Second Number: ",0
out1 BYTE " + ",0
out2 BYTE " - ",0
out3 BYTE " X ",0
out4 BYTE 20, F7, 20,0
out5 BYTE " = ",0
out6 BYTE " remainder ",0 
EndText BYTE "Impressed? Bye!",0
FirstNum DWORD ?
SecondNum DWORD ?
Sum DWORD ?
Difference DWORD ?
Product DWORD ?
Quotient DWORD ?
Remainder DWORD ?

.code
main PROC
;Displays Title, Name, and instructions
    mov edx, OFFSET StartText
    call WriteString
    call crlf
    call crlf
    mov edx, OFFSET InstructText
    call WriteString
    call crlf
    call crlf

;Prompts for user input and stores the values as FirstNum and SecondNum
    mov edx, OFFSET FirstNumText
    call WriteString
    call ReadInt
    mov FirstNum, eax
    mov edx, OFFSET SecondNumText
    call WriteString
    call ReadInt
    mov SecondNum, eax

;Finds the Sum
    mov eax, FirstNum
    add eax, SecondNum
    mov Sum, eax

;Finds the difference
    mov eax, FirstNum
    sub eax, SecondNum
    mov Difference, eax

;Finds the product
    mov eax, FirstNum
    imul eax, SecondNum
    mov Quotient, eax

;Finds the quotient and remainder
    mov eax, FirstNum
    mov ebx, SecondNum
    mov edx, 0
    idiv ebx
    mov Quotient, eax
    mov Remainder, edx

;Prints the Results for Sum
    call crlf
    mov eax, FirstNum
    call WriteDec
    mov edx, OFFSET out1
    call WriteString
    mov eax, SecondNum
    call WriteDec
    mov edx, out5
    call WriteString
    mov eax, Sum
    call WriteDec
    call crlf

;Prints the results for Difference
    mov eax, FirstNum
    call WriteDec
    mov edx, OFFSET out2
    call WriteString
    mov eax, SecondNum
    call WriteDec
    mov edx, out5
    call WriteString
    mov eax, Difference
    call WriteDec
    call crlf

;Prints the results for Product
    mov eax, FirstNum
    call WriteDec
    mov edx, OFFSET out3
    call WriteString
    mov eax, SecondNum
    call WriteDec
    mov edx, out5
    call WriteString
    mov eax, Product
    call WriteDec
    call crlf

;Prints the results forQuotient and Remainder
    mov eax, FirstNum
    all WriteDec
    mov edx, OFFSET out4
    call WriteString
    mov eax, SecondNum
    call WriteDec
    mov edx, out5
    call WriteString
    mov eax, Quotient
    call WriteDec
    mov edx, out6
    call WriteString
    mov eax, Remainder
    call WriteDec
    call crlf
    call crlf

;Says Goodbye
    mov edx, EndText
    call WriteString
    exit
main ENDP

END main