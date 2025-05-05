include Irvine32.inc

.data
weekdays BYTE "Sunday",0, "Monday",0, "Tuesday",0, "Wednesday",0,
               "Thursday",0, "Friday",0, "Saturday",0
prompt BYTE "Enter day number (1-7): ",0
errorMsg BYTE "Invalid input",0

.code
main proc
    mov edx, offset prompt
    call WriteString
    call ReadInt
    
    ; Validate input
    cmp eax, 1
    jl invalid
    cmp eax, 7
    jg invalid
    
    ; Calculate offset
    dec eax
    mov ebx, 10        ; max length of weekday names
    mul ebx
    mov edx, offset weekdays
    add edx, eax
    
    call WriteString
    jmp done
    
invalid:
    mov edx, offset errorMsg
    call WriteString
    
done:
    call Crlf
    exit
main endp
end main
