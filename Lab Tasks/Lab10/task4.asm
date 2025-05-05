include Irvine32.inc

.data
Str1 BYTE "Hello World!",0
reversedMsg BYTE "Reversed string: ",0

.code
main proc
    push offset Str1
    call Str_Reverse
    add esp, 4
    
    ; Display reversed string
    mov edx, offset reversedMsg
    call WriteString
    mov edx, offset Str1
    call WriteString
    call Crlf
    
    exit
main endp

Str_Reverse proc
    push ebp
    mov ebp, esp
    push esi
    push edi
    push ebx
    
    mov esi, [ebp+8]   ; string offset
    mov edi, esi
    
    ; Find end of string
findEnd:
    cmp byte ptr [edi], 0
    je foundEnd
    inc edi
    jmp findEnd
foundEnd:
    dec edi            ; point to last character before null
    
swapLoop:
    cmp esi, edi
    jge done
    
    ; Swap characters
    mov al, [esi]
    mov bl, [edi]
    mov [esi], bl
    mov [edi], al
    
    inc esi
    dec edi
    jmp swapLoop

done:
    pop ebx
    pop edi
    pop esi
    pop ebp
    ret
Str_Reverse endp

end main
