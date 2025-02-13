; Layyana Junaid 23k-0056 BSAI-4A
; Lab 3 Task 6

INCLUDE Irvine32.inc

.data
    a BYTE 00010001b  ; a = 11h in binary
    b BYTE 00010000b  ; b = 10h in binary
    c1 BYTE 00110000b  ; c = 30h in binary
    d BYTE 01000000b  ; d = 40h in binary
    result DWORD ?    ; Store final result

.code
main PROC
    movzx eax, a
    add eax, b

    movzx ebx, a
    sub ebx, b

    sub eax, ebx
    add eax, c1
    add eax, d

    mov result, eax
    call DumpRegs  
    call writeint

    exit
main ENDP
END main


