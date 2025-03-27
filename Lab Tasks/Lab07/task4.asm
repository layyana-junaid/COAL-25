include Irvine32.inc

.data
    star BYTE '*', 0
    space BYTE ' ', 0
    newline BYTE 0Dh, 0Ah, 0
    maxColumns DWORD 5    

.code
main proc
    mov ecx, 1            
    
PrintPattern:
    ;spaces needed (maxColumns - current row)
    mov eax, maxColumns
    sub eax, ecx          ; spaces to print = maxColumns - current row
    mov ebx, eax          ; EBX = space counter
    
PrintSpaces:
    cmp ebx, 0
    jle PrintStars        
    mov edx, OFFSET space
    call WriteString
    dec ebx
    jmp PrintSpaces
    
PrintStars:
    push ecx              
    mov ebx, ecx          
    
PrintStarLoop:
    mov edx, OFFSET star
    call WriteString
    dec ebx
    jnz PrintStarLoop
    
    mov edx, OFFSET newline
    call WriteString
    
    pop ecx               
    inc ecx              
    cmp ecx, maxColumns
    jle PrintPattern     

main endp
end main
