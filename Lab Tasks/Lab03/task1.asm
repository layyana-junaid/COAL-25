; Layyana Junaid 23k-0056 BSAI-4A
; Lab 3 Task 1

INCLUDE Irvine32.inc

.data
   val2 BYTE -11    ; 8-bit signed integer initialized with -11

.data?
   val1 WORD ?      ; Uninitialized 16-bit signed integer (space reserved)

.code
main PROC
    ; Initialize ax to 0
    mov ax, 0        

    mov al, val2     ; AL = val2 
    call WriteDec    
    mov ax, val1     ; AX = val1 
    exit
main ENDP

END main
