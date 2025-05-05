include Irvine32.inc

.data
array dword 10 dup(?)
prompt BYTE "Enter multiplier: ",0

.code
main proc
    ; Get multiplier from user
    mov edx, offset prompt
    call WriteString
    call ReadInt
    
    ; Load array
    push offset array
    push eax           ; multiplier
    call Load
    add esp, 8
    
    ; Display array
    mov ecx, lengthof array
    mov esi, offset array
displayLoop:
    mov eax, [esi]
    call WriteInt
    call Crlf
    add esi, 4
    loop displayLoop
    
    exit
main endp

Load proc
    push ebp
    mov ebp, esp
    push esi
    push ecx
    push ebx
    
    mov esi, [ebp+12]  ; array offset
    mov ebx, [ebp+8]   ; multiplier
    mov ecx, lengthof array
    xor edx, edx       ; index counter

loadLoop:
    mov eax, edx       ; current index
    imul eax, ebx      ; multiply by multiplier
    mov [esi], eax
    add esi, 4
    inc edx
    loop loadLoop
    
    pop ebx
    pop ecx
    pop esi
    pop ebp
    ret
Load endp

end main
