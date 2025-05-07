;Task 1 
;EAX * 21 where 21 = 16 + 4 + 1 (2^4 + 2^2 + 2^0)
mov ebx, eax    ; Save original value in EBX
shl eax, 4      ; Multiply by 16 (2^4)
shl ebx, 2      ; Multiply original by 4 (2^2)
add eax, ebx    ; Add 16x + 4x
add eax, [original] ; Add original x (1x) assuming you stored it

;Task 2
mov ax, -128     ; AX = -128 (FF80h)

; Sign extend AX to EAX using shift/rotate
movsx eax, ax   ; The obvious way, but not using shift/rotate

; Using shift/rotate instructions:
movzx eax, ax    ; First zero extend
ror eax, 16      ; Rotate right 16 bits to get AX in high word
sar eax, 16      ; Arithmetic shift right to sign extend

;Task 3
mov cx, ax       ; Copy AX to CX
and cx, 1        ; Isolate lowest bit of AX
shl bx, 1        ; Make room in BX's high bit
ror cx, 1        ; Move the bit to highest position
or bx, cx        ; Combine with BX

;Task 4
; val1 = (val2 / val3) * (val1 / val2)
.data
val1 SDWORD ?
val2 SDWORD ?
val3 SDWORD ?

.code
mov eax, val2    ; EAX = val2
cdq              ; Sign extend into EDX
idiv val3        ; EAX = val2 / val3
mov ebx, eax     ; Save result in EBX

mov eax, val1    ; EAX = val1
cdq              ; Sign extend into EDX
idiv val2        ; EAX = val1 / val2

imul ebx         ; EAX = (val2/val3) * (val1/val2)
mov val1, eax    ; Store result in val1

;Task 5
; Procedure to add two 64-bit integers
; Receives: EDX:EAX = first 64-bit number
;           ECX:EBX = second 64-bit number
; Returns:  EDX:EAX = sum
Extended_Add PROC
    add eax, ebx    ; Add low parts
    adc edx, ecx    ; Add high parts with carry
    ret
Extended_Add ENDP

; Example usage:
mov edx, highPart1
mov eax, lowPart1
mov ecx, highPart2
mov ebx, lowPart2
call Extended_Add
; Result is in EDX:EAX

