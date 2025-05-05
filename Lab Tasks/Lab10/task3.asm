include Irvine32.inc

.data
Str1 BYTE "Hello",0
Str2 BYTE "Hello",0
Str3 BYTE "World",0
equalMsg BYTE "Strings are equal",0
notEqualMsg BYTE "Strings are not equal",0

.code
main proc
    ; Compare equal strings
    push offset Str1
    push offset Str2
    call IsCompare
    add esp, 8
    
    ; Compare different strings
    push offset Str1
    push offset Str3
    call IsCompare
    add esp, 8
    
    exit
main endp

IsCompare proc
    push ebp
    mov ebp, esp
    push esi
    push edi
    
    mov esi, [ebp+12]  ; first string
    mov edi, [ebp+8]   ; second string

compareLoop:
    mov al, [esi]
    mov bl, [edi]
    cmp al, bl
    jne notEqual
    cmp al, 0          ; check for null terminator
    je equal
    inc esi
    inc edi
    jmp compareLoop

equal:
    mov edx, offset equalMsg
    call WriteString
    call Crlf
    jmp done

notEqual:
    mov edx, offset notEqualMsg
    call WriteString
    call Crlf

done:
    pop edi
    pop esi
    pop ebp
    ret
IsCompare endp

end main
