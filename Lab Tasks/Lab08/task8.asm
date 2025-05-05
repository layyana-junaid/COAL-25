include Irvine32.inc

.data
prompt BYTE "Enter a character: ",0
alphaMsg BYTE " is an alphabet",0
notAlphaMsg BYTE " is not an alphabet",0

.code
main proc
    mov edx, offset prompt
    call WriteString
    call ReadChar
    call WriteChar      ; echo the character
    
    ; Check if alphabet
    cmp al, 'A'
    jb notAlpha
    cmp al, 'Z'
    jbe isAlpha
    cmp al, 'a'
    jb notAlpha
    cmp al, 'z'
    ja notAlpha
    
isAlpha:
    mov edx, offset alphaMsg
    call WriteString
    jmp done
    
notAlpha:
    mov edx, offset notAlphaMsg
    call WriteString
    
done:
    call Crlf
    exit
main endp
end main
