include Irvine32.inc

.data
Str1 BYTE '127&j~3#^&*#*#45^',0
foundMsg BYTE "Character found at index: ",0
notFoundMsg BYTE "Character not found",0

.code
main proc
    call Scan_String
    exit
main endp

Scan_String proc
    mov esi, offset Str1
    mov ecx, lengthof Str1
    mov al, '#'
    xor ebx, ebx       ; index counter

searchLoop:
    cmp byte ptr [esi], al
    je found
    inc esi
    inc ebx
    loop searchLoop

    ; Not found
    mov edx, offset notFoundMsg
    call WriteString
    call Crlf
    ret

found:
    mov edx, offset foundMsg
    call WriteString
    mov eax, ebx
    call WriteDec
    call Crlf
    ret
Scan_String endp

end main
