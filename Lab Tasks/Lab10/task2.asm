include Irvine32.inc

.data
Str1 BYTE '127&j~3#^&*#*#45^',0
foundMsg BYTE "Character found at index: ",0
notFoundMsg BYTE "Character not found",0

.code
main proc
    push offset Str1
    push '#'
    call Scan_String_Param
    add esp, 8
    
    exit
main endp

Scan_String_Param proc
    push ebp
    mov ebp, esp
    push esi
    push ecx
    push ebx
    
    mov esi, [ebp+12]  ; string offset
    mov al, [ebp+8]    ; character to search
    xor ebx, ebx       ; index counter

searchLoop:
    cmp byte ptr [esi], 0
    je notFound
    cmp byte ptr [esi], al
    je found
    inc esi
    inc ebx
    jmp searchLoop

notFound:
    mov edx, offset notFoundMsg
    call WriteString
    call Crlf
    jmp done

found:
    mov edx, offset foundMsg
    call WriteString
    mov eax, ebx
    call WriteDec
    call Crlf

done:
    pop ebx
    pop ecx
    pop esi
    pop ebp
    ret
Scan_String_Param endp

end main
