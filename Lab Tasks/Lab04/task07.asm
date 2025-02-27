;Layyana Junaid 23k-0056 BSAI-4A
;Lab04 task7
.data
    A WORD 0FF10h
    B WORD 0E10Bh

.code
main PROC
    mov ax, A    ; Load value of A into AX
    mov bx, B    ; Load value of B into BX

    ; Swap using a temporary register (CX)
    mov cx, ax   ; Store A in CX (temporary register)
    mov ax, bx   ; Move B into A
    mov bx, cx   ; Move original A (stored in CX) into B

    ; Store back the swapped values
    mov A, ax  
    mov B, bx  

    exit
main ENDP
END main
