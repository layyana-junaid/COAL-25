include Irvine32.inc

.code
main proc
    call LocalSquare
    exit
main endp

LocalSquare proc
    push ebp
    mov ebp, esp
    sub esp, 4         ; Allocate 4 bytes for local variable
    
    ; Get input from user
    call ReadInt
    mov [ebp-4], eax  ; Store in local variable
    
    ; Calculate and display square
    imul eax, eax
    call WriteInt
    call Crlf
    
    mov esp, ebp      ; Deallocate local variable
    pop ebp
    ret
LocalSquare endp

end main
