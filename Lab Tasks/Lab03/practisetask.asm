;Layyana Junaid 23k-0056 BSAI-4A
;Lab 3 Practise Tasks
INCLUDE Irvine32.inc

.data
   value BYTE 10    ; 8-bit unsigned integer which is storing 10 

.code
   main PROC
   ; Move the 'value' (10) into the AL register
   mov al, value    ; (AL = 10)

   ; Add 40 to AL
   add al, 40       ; AL = 10 + 40 = 50

   ; Move AL to EAX (32-bit register) for correct printing
   movzx eax, al    ; Zero-extend AL to EAX (EAX = AL = 50)

   ; Print the result in decimal
   call WriteDec    ; 
   ; Exit program
   exit
main ENDP

END main

