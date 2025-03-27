include Irvine32.inc

.data
    promptSize BYTE "Enter array size (1-10): ", 0
    promptValue BYTE "Enter value: ", 0
    resultMsg BYTE "The sum is: ", 0
    array DWORD 10 DUP(?)
    errorMsg BYTE "Invalid size! Must be 1-10", 0Dh, 0Ah, 0

.code
main proc
    mov edx, OFFSET promptSize
    call WriteString
    call ReadInt
    
    cmp eax, 1
    jl InvalidSize
    cmp eax, 10
    jg InvalidSize
    
    mov ecx, eax      
    mov esi, 0        
    
InputLoop:
    ; Get array values from user
    mov edx, OFFSET promptValue
    call WriteString
    call ReadInt
    mov array[esi*4], eax  
    inc esi
    loop InputLoop
    
    ; Calculate sum
    mov ecx, esi        
    mov esi, 0
    mov eax, 0          
    
SumLoop:
    add eax, array[esi*4]
    inc esi
    loop SumLoop
    
    ; Display result
    mov edx, OFFSET resultMsg
    call WriteString
    call WriteInt       
    call Crlf
    
    jmp ExitProgram
    
InvalidSize:
    mov edx, OFFSET errorMsg
    call WriteString
    
ExitProgram:
main endp
end main
