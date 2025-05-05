include Irvine32.inc

.data
numbers dword 4 dup(?)
allPrime byte 1        ; Flag to track if all numbers are prime
prompt1 byte "Enter 4 numbers: ",0
prompt2 byte " is prime",0
prompt3 byte " is not prime",0
prompt4 byte "Largest prime: ",0

.code
main proc
    ; Get input numbers
    mov edx, offset prompt1
    call WriteString
    call Crlf
    
    mov ecx, 4
    mov esi, offset numbers
inputLoop:
    call ReadInt
    mov [esi], eax
    add esi, 4
    loop inputLoop
    
    ; Check each number for primality
    mov ecx, 4
    mov esi, offset numbers
checkLoop:
    push [esi]         ; Pass number to CheckPrime
    call CheckPrime
    add esp, 4
    
    cmp eax, 0         ; Check return value (1=prime, 0=not prime)
    je notPrime
    
    ; Display prime message
    mov eax, [esi]
    call WriteInt
    mov edx, offset prompt2
    call WriteString
    call Crlf
    jmp nextCheck
    
notPrime:
    ; Display not prime message and set flag
    mov allPrime, 0
    mov eax, [esi]
    call WriteInt
    mov edx, offset prompt3
    call WriteString
    call Crlf
    
nextCheck:
    add esi, 4
    loop checkLoop
    
    ; Check if all numbers are prime
    cmp allPrime, 1
    jne done
    
    ; Call LargestPrime if all are prime
    push offset numbers
    call LargestPrime
    add esp, 4
    
done:
    exit
main endp

CheckPrime proc
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    
    mov eax, [ebp+8]   ; Get the number
    cmp eax, 2
    jl notPrimeNum     ; Numbers less than 2 are not prime
    je isPrimeNum      ; 2 is prime
    
    ; Check if even
    test eax, 1
    jz notPrimeNum
    
    ; Check divisors up to sqrt(n)
    mov ecx, 3         ; Start with divisor 3
    mov ebx, eax
    call sqrt          ; ebx = sqrt(n)
    
checkDivisors:
    cmp ecx, ebx
    jg isPrimeNum
    
    mov eax, [ebp+8]
    xor edx, edx
    div ecx
    cmp edx, 0
    je notPrimeNum
    
    add ecx, 2         ; Check next odd number
    jmp checkDivisors
    
isPrimeNum:
    mov eax, 1         ; Return 1 for prime
    jmp doneCheck
    
notPrimeNum:
    mov eax, 0         ; Return 0 for not prime
    
doneCheck:
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret

sqrt:
    ; Approximate integer square root (eax = number, returns in ebx)
    push eax
    push ecx
    push edx
    
    mov ebx, eax
    xor ecx, ecx
    
sqrtLoop:
    inc ecx
    mov eax, ecx
    mul eax
    cmp eax, ebx
    jle sqrtLoop
    
    mov ebx, ecx       ; ebx = floor(sqrt(n))
    
    pop edx
    pop ecx
    pop eax
    ret
CheckPrime endp

LargestPrime proc
    push ebp
    mov ebp, esp
    push esi
    push ecx
    
    mov esi, [ebp+8]   ; Get array address
    mov eax, [esi]     ; Initialize with first number
    mov ecx, 3         ; Check remaining 3 numbers
    
findLargest:
    add esi, 4
    mov ebx, [esi]
    cmp ebx, eax
    jle nextNum
    mov eax, ebx
    
nextNum:
    loop findLargest
    
    ; Display largest prime
    mov edx, offset prompt4
    call WriteString
    call WriteInt
    call Crlf
    
    pop ecx
    pop esi
    pop ebp
    ret
LargestPrime endp

end main
