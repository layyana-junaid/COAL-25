include Irvine32.inc

.data
    resultMsg BYTE "The sum is: ", 0

.code
main proc
    push 31        ; First number
    push 24        ; Second number
    push 28        ; Third number

    pop eax   ; eax = 31
    pop ebx      ; eax = 24 
    add eax, ebx  ; adding 31 + 24
    pop ebx  ; eax = 28     
    add eax, ebx   ; 55 + 28 = eax

    mov edx, OFFSET resultMsg
    call WriteString
    call WriteInt   ; Display sum in EAX
    call Crlf

main endp
end main
