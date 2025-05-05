include Irvine32.inc

.data
array dword 10, 5, 20, 3, 15, 7, 8, 12, 1, 18
arraySize = ($ - array) / 4

.code
main proc
    push offset array  ; Pass array address
    push arraySize     ; Pass array size
    call BubbleSort
    add esp, 8         ; Clean up stack
    
    ; Display sorted array
    mov ecx, arraySize
    mov esi, offset array
displayLoop:
    mov eax, [esi]
    call WriteInt
    call Crlf
    add esi, 4
    loop displayLoop
    
    exit
main endp

BubbleSort proc
    push ebp
    mov ebp, esp
    push esi
    push edi
    push ecx
    push ebx
    
    mov esi, [ebp+12]  ; Array address
    mov ecx, [ebp+8]   ; Array size
    dec ecx            ; Outer loop counter (n-1)
    
outerLoop:
    push ecx           ; Save outer loop counter
    mov edi, esi       ; Inner loop pointer
    
innerLoop:
    mov eax, [edi]     ; Current element
    mov ebx, [edi+4]   ; Next element
    cmp eax, ebx
    jle noSwap
    
    ; Swap elements
    mov [edi], ebx
    mov [edi+4], eax
    
noSwap:
    add edi, 4         ; Move to next element
    loop innerLoop
    
    pop ecx            ; Restore outer loop counter
    loop outerLoop
    
    pop ebx
    pop ecx
    pop edi
    pop esi
    pop ebp
    ret
BubbleSort endp

end main
