include irvine32.inc

.data
	arr BYTE 61,43,11,52,25
	newarr BYTE LENGTHOF arr DUP(?)

.code
main PROC
    mov esi, OFFSET arr

    mov al, [esi+2] 
    mov newarr[0], al

    mov al, [esi+4] 
    mov newarr[1], al

    mov al, [esi+1]  
    mov newarr[2], al

    mov al, [esi+3]  
    mov newarr[3], al

    mov al, [esi] 
    mov newarr[4], al

    mov esi, 0
    mov ecx, LENGTHOF newarr

printarr:
    movzx eax, newarr[esi*TYPE newarr]
    call WriteInt
    call Crlf ; for leaving lines for clean output
    inc esi
    loop printarr
    exit
main endp
end main
