INCLUDE Irvine32.inc
.code
main PROC

    mov edx, 0
    mov ebx, 1
    mov ecx, 10

L1:

    mov eax, edx
    call WriteDec
    call Crlf
    add eax, ebx
   

    mov edx, ebx
    mov ebx, eax
    loop L1
    invoke ExitProcess, 0

main ENDP

End main
