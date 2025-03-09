include irvine32.inc

.data
	array DWORD 500, 600, 1000, 5000, 400

.code
main PROC
    mov esi, OFFSET array
    mov eax, [esi]
    
    add esi, 4
    sub eax, [esi]

    add esi, 4
    sub eax, [esi]

    add esi, 4
    sub eax, [esi]

    add esi, 4
    sub eax, [esi]
    call writeint

    exit
main endp
end main
