; Layyana Junaid 23k-0056 BSAI-4A
; Lab 4 Task 6
.data
    SecondsInDay EQU 24 * 60 * 60  ; Define symbolic constant (86400)
    message BYTE "Seconds in a day: ", 0  ; Message to display

.code
main PROC
    ; Display message
    mov edx, OFFSET message
    call WriteString

    ; Load the constant value into EAX
    mov eax, SecondsInDay   ; Load 86400 into EAX

    ; Print the number in decimal format
    call WriteDec   ; Displays the number in EAX

    ; Print a newline
    call CrLf

    exit
main ENDP
END mains
