include Irvine32.inc

.data
intArr SWORD 0, 0, 0, 150, 120, 35, -12, 66, 4, 0
foundMsg BYTE "First non-zero value: ",0
notFoundMsg BYTE "All values are zero",0

.code
main proc
    mov esi, offset intArr
    mov ecx, lengthof intArr
    
searchLoop:
    cmp WORD PTR [esi], 0
    jne found
    add esi, 2
    loop searchLoop
    
    ; Not found
    mov edx, offset notFoundMsg
    call WriteString
    jmp done
    
found:
    mov edx, offset foundMsg
    call WriteString
    movsx eax, WORD PTR [esi]
    call WriteInt
    
done:
    call Crlf
    exit
main endp
end main
