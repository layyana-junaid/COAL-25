TITLE task
include irvine32.inc

.data
	arrayB BYTE 10, 20, 30 
    arrayW WORD 150, 250, 350 
    arrayD DWORD 600, 1200, 1800
    SUM1 DWORD ?
    SUM2 DWORD ?
    SUM3 DWORD ?

.code
main PROC
    mov esi, 0

    movzx ebx, arrayB[esi*TYPE arrayB]
    mov SUM1, ebx
    movzx ebx, arrayW[esi*TYPE arrayW]
    add SUM1, ebx
    mov ebx, arrayD[esi*TYPE arrayD]
    add SUM1, ebx
    inc esi

    movzx ebx, arrayB[esi*TYPE arrayB]
    mov SUM2, ebx
    movzx ebx, arrayW[esi*TYPE arrayW]
    add SUM2, ebx
    mov ebx, arrayD[esi*TYPE arrayD]
    add SUM2, ebx
    inc esi
    
    movzx ebx, arrayB[esi*TYPE arrayB]
    mov SUM3, ebx
    movzx ebx, arrayW[esi*TYPE arrayW]
    add SUM3, ebx
    mov ebx, arrayD[esi*TYPE arrayD]
    add SUM3, ebx
    inc esi

    mov eax, SUM1
    call writeint
    call crlf
    mov eax, SUM2
    call writeint
    call crlf
    mov eax, SUM3
    call writeint
    call crlf

    exit
main endp
end main
