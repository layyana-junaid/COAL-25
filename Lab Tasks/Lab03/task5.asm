; Layyana Junaid 23k-0056 BSAI-4A
; Lab 3 Task 5

INCLUDE Irvine32.inc

.data
    a DWORD 11h    ; 17 in decimal
    b DWORD 10h    ; 16 in decimal
    e DWORD 30h    ; 48 in decimal
    d DWORD 40h    ; 64 in decimal
    result DWORD ? ; To store the final result

.code
main PROC
    mov eax, a        ; EAX = a (17)
    add eax, b        ; EAX = a + b = 17 + 16 = 33

    mov ebx, a        ; EBX = a (17)
    sub ebx, b        ; EBX = a - b = 17 - 16 = 1

    sub eax, ebx      ; EAX = (a+b) - (a-b) = 33 - 1 = 32
    add eax, e        ; EAX = (a+b) - (a-b) + e = 32 + 48 = 80
    add eax, d        ; EAX = (a+b) - (a-b) + e + d = 80 + 64 = 144

    mov result, eax   
    call DumpRegs
    call writeint 

    exit
main ENDP
END main

