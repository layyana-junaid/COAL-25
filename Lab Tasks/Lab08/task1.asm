include Irvine32.inc

.data
prompt BYTE "Enter four integers: ",0
equalMsg BYTE "All numbers are equal",0
notEqualMsg BYTE "Numbers are not equal",0
nums DWORD 4 dup(?)

.code
main proc
    mov edx, offset prompt
    call WriteString
    
    ; Read four integers
    mov ecx, 4
    mov esi, offset nums
readLoop:
    call ReadInt
    mov [esi], eax
    add esi, 4
    loop readLoop
    
    ; Compare all four
    mov eax, nums[0]
    cmp eax, nums[4]
    jne notEqual
    cmp eax, nums[8]
    jne notEqual
    cmp eax, nums[12]
    jne notEqual
    
    ; All equal
    mov edx, offset equalMsg
    call WriteString
    jmp done
    
notEqual:
    mov edx, offset notEqualMsg
    call WriteString
    
done:
    call Crlf
    exit
main endp
end main
