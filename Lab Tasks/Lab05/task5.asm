include irvine32.inc

.data
	array1 BYTE 10, 20, 30, 40
    array2 BYTE 4 DUP (?)

.code
main PROC
    mov esi, OFFSET array1
    add esi, LENGTHOF array1-1
    mov edi, OFFSET array2

    mov al, [esi]
    mov [edi], al
    inc edi
    dec esi

    mov al, [esi]
    mov [edi], al
    inc edi
    dec esi

    mov al, [esi]
    mov [edi], al
    inc edi
    dec esi

    mov al, [esi]
    mov [edi], al
    inc edi
    dec esi

    mov ecx, LENGTHOF array2
    mov esi, 0
    printarr:
        movzx eax, array2[esi]
        inc esi
        call writeint
        call crlf
    loop printarr
    exit
main endp
end main
