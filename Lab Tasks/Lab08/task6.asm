include Irvine32.inc

.data
arr WORD 10, 4, 7, 14, 299, 156, 3, 19, 29, 300, 20
arrSize = ($ - arr) / 2

.code
main proc
    mov ecx, arrSize
    dec ecx             ; outer loop counter
    
outerLoop:
    push ecx
    mov esi, offset arr
    
innerLoop:
    mov ax, [esi]
    cmp ax, [esi+2]
    jle noSwap
    
    ; Swap elements
    mov dx, [esi+2]
    mov [esi+2], ax
    mov [esi], dx
    
noSwap:
    add esi, 2
    loop innerLoop
    
    pop ecx
    loop outerLoop
    
    ; Display sorted array
    mov esi, offset arr
    mov ecx, arrSize
displayLoop:
    movzx eax, WORD PTR [esi]
    call WriteInt
    call Crlf
    add esi, 2
    loop displayLoop
    
    exit
main endp
end main
