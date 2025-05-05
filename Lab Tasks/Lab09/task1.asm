include Irvine32.inc

.data
num1 dword 5
num2 dword 7
num3 dword 3

.code
main proc
    ; Push parameters onto stack in reverse order
    push num3
    push num2
    push num1
    call ThreeProd
    add esp, 12       ; Clean up stack
    
    exit
main endp

ThreeProd proc
    push ebp
    mov ebp, esp
    
    ; Access parameters
    mov eax, [ebp+8]   ; num1
    imul eax, [ebp+12] ; num1 * num2
    imul eax, [ebp+16] ; (num1 * num2) * num3
    
    call WriteInt      ; Display product
    call Crlf
    
    pop ebp
    ret
ThreeProd endp

end main
