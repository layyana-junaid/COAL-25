;Layyana Junaid 23k-0056 BSAI-4A
;Lab04 task 8
.data
    val1 BYTE 10h      ; 8-bit value
    val2 WORD 8000h    ; 16-bit value
    val3 DWORD 0FFFFh  ; 32-bit value
    val4 WORD 7FFFh    ; 16-bit value

.code
main PROC
    ; i. Increment val2
    mov ax, val2  ; Load val2 into AX
    inc ax        ; Increment it by 1
    mov val2, ax  ; Store the result back

    ; ii. Subtract val3 from EAX
    mov eax, 100000h  ; Assume EAX has some initial value
    sub eax, val3     ; Subtract val3 from EAX

    ; iii. Subtract val4 from val2
    mov ax, val2   ; Load val2 into AX
    sub ax, val4   ; Subtract val4 from AX
    mov val2, ax   ; Store the result back into val2

    exit
main ENDP
END main
