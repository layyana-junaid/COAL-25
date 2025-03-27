include Irvine32.inc

.data
    arr1 WORD 2, 4, 6, 8, 10
    arr2 WORD 1, 3, 5, 7, 9
    arr3 WORD 1, 2, 3, 4, 5
    procedure1 BYTE "Sum of 1st Array: ", 0
    procedure2 BYTE "Sum of 2nd Array: ", 0
    procedure3 BYTE "Sum of 3rd Array: ", 0
    finalSum BYTE "Combined sum of all arrays: ", 0
    arraySize = 5

.code
main proc
    ; Calculate sum of arr1
    mov esi, OFFSET arr1
    mov ecx, arraySize
    call SumArray1
    push eax        
    
    ; Display sum of arr1
    mov edx, OFFSET procedure1
    call WriteString
    call WriteInt
    call Crlf
    
    ; Calculate sum of arr2
    mov esi, OFFSET arr2
    mov ecx, arraySize
    call SumArray2
    push eax       
    
    ; Display sum of arr2
    mov edx, OFFSET procedure2
    call WriteString
    call WriteInt
    call Crlf
    
    ; Calculate sum of arr3
    mov esi, OFFSET arr3
    mov ecx, arraySize
    call SumArray3
    push eax        
    
    ; Display sum of arr3
    mov edx, OFFSET procedure3
    call WriteString
    call WriteInt
    call Crlf
    
    ; Calculate combined sum
    pop ebx         ; Get sum of arr3
    pop eax         ; Get sum of arr2
    add eax, ebx    ; Add sum of arr2 and arr3
    pop ebx         ; Get sum of arr1
    add eax, ebx    ; Add sum of arr1
    
    ; Display final result
    mov edx, OFFSET finalSum
    call WriteString
    call WriteInt
    call Crlf
main endp

SumArray1 proc
    xor eax, eax        ; Clear sum register
    xor ebx, ebx        ; Clear index register
    
    SumLoop:
        mov bx, [esi]   ; Get array element (WORD)
        add eax, ebx    ; Add to sum
        add esi, 2      ; Move to next element (WORD = 2 bytes)
        loop SumLoop
    
    ret
SumArray1 endp


SumArray2 proc
    xor eax, eax        
    xor ebx, ebx        
    
    SumLoop:
        mov bx, [esi]  
        add eax, ebx    
        add esi, 2      
        loop SumLoop
    
    ret
SumArray2 endp


SumArray3 proc
    xor eax, eax      
    xor ebx, ebx       
    
    SumLoop:
        mov bx, [esi]   
        add eax, ebx    
        add esi, 2      
        loop SumLoop
    
    ret
SumArray3 endp
end main
