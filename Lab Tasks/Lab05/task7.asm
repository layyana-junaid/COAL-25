
include irvine32.inc

.data
	arrayB BYTE 60, 70, 80
    arrayW WORD 150, 250, 350
    arrayD DWORD 600, 1200, 1800

.code
main PROC
    
    mov esi, 0
    mov al, arrayB[esi * TYPE arrayB]
    add esi, LENGTHOF arrayB-1
    add al, arrayB[esi * TYPE arrayB]
    movzx eax, al
    call writeint
    call crlf

    mov esi, 0
    mov ax, arrayW[esi * TYPE arrayW]
    add esi, LENGTHOF arrayW-1
    add ax, arrayW[esi * TYPE arrayW]
    movzx eax, ax
    call writeint
    call crlf

    mov esi, 0
    mov eax, arrayD[esi * TYPE arrayD]
    add esi, LENGTHOF arrayD-1
    add eax, arrayD[esi * TYPE arrayD]
    call writeint
    call crlf

    exit
main endp
end main
