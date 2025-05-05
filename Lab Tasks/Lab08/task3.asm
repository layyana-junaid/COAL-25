include Irvine32.inc

.data
var DWORD 5
x DWORD ?
intArr SWORD 0, 0, 0, 150, 120, 35, -12, 66, 4, 0

.code
main proc
    ; Initialize values
    mov edx, var
    inc edx             ; edx = var + 1
    mov esi, offset intArr
    mov ecx, [esi+6]    ; Get value from array (35)
    
    ; Condition check
    cmp var, ecx
    jge elsePart
    cmp ecx, edx
    jl elsePart
    
    ; Then part
    mov x, 0
    jmp done
    
elsePart:
    mov x, 1
    
done:
    mov eax, x
    call WriteInt
    call Crlf
    exit
main endp
end main
