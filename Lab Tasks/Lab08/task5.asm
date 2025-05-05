include Irvine32.inc

.data
arr WORD 10, 4, 7, 14, 299, 156, 3, 19, 29, 300, 20
prompt BYTE "Enter a number to search: ",0
foundMsg BYTE "Number found at index ",0
notFoundMsg BYTE "Number not found",0

.code
main proc
    mov edx, offset prompt
    call WriteString
    call ReadInt
    
    mov esi, offset arr
    mov ecx, lengthof arr
    xor ebx, ebx        ; index counter
    
searchLoop:
    cmp ax, [esi]
    je found
    add esi, 2
    inc ebx
    loop searchLoop
    
    ; Not found
    mov edx, offset notFoundMsg
    call WriteString
    jmp done
    
found:
    mov edx, offset foundMsg
    call WriteString
    mov eax, ebx
    call WriteDec
    
done:
    call Crlf
    exit
main endp
end main
