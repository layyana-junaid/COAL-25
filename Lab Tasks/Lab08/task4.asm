include Irvine32.inc

.data
var DWORD 0
helloMsg BYTE "Hello",0
worldMsg BYTE "World",0

.code
main proc
whileLoop:
    cmp var, 10
    jg endWhile
    
    cmp var, 5
    jge elsePart
    
    ; Print "Hello"
    mov edx, offset helloMsg
    call WriteString
    call Crlf
    jmp endIf
    
elsePart:
    ; Print "World"
    mov edx, offset worldMsg
    call WriteString
    call Crlf
    
endIf:
    inc var
    jmp whileLoop
    
endWhile:
    exit
main endp
end main
