include Irvine32.inc

.data
array dword 10, 5, 20, 3, 15, 7, 8, 12, 1, 18, 
      4, 9, 11, 6, 19, 2, 13, 16, 14, 17
arraySize = ($ - array) / 4

.code
main proc
    push offset array  ; Pass array by reference
    call MinMaxArray
    add esp, 4         ; Clean up stack
    
    exit
main endp

MinMaxArray proc
    push ebp
    mov ebp, esp
    push esi
    push ecx
    
    mov esi, [ebp+8]   ; Get array address
    mov ecx, arraySize ; Set loop counter
    
    ; Initialize min and max with first element
    mov eax, [esi]     ; min
    mov ebx, [esi]     ; max
    
    add esi, 4         ; Move to next element
    dec ecx
    
arrayLoop:
    mov edx, [esi]     ; Get current element
    
    ; Check for min
    cmp edx, eax
    jge notMin
    mov eax, edx       ; Update min
    
notMin:
    ; Check for max
    cmp edx, ebx
    jle notMax
    mov ebx, edx       ; Update max
    
notMax:
    add esi, 4         ; Next element
    loop arrayLoop
    
    ; Display results
    push eax           ; Save min
    mov eax, ebx       ; Display max first
    call WriteInt
    call Crlf
    pop eax            ; Restore min
    call WriteInt
    call Crlf
    
    pop ecx
    pop esi
    pop ebp
    ret
MinMaxArray endp

end main
