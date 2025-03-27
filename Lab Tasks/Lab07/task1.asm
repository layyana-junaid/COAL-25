include Irvine32.inc

.data
    sourceArray WORD 10, 20, 30, 40, 50, 60, 70, 80, 90, 100  
    destArray WORD 10 DUP(?)                                     
    arraySize = LENGTHOF sourceArray                           
    
    originalMsg BYTE "Original array: ", 0
    copiedMsg BYTE "Copied array: ", 0
    space BYTE " ", 0

.code
main proc
    ; Display original array
    mov edx, OFFSET originalMsg
    call WriteString
    
    mov esi, 0
    mov ecx, arraySize
DisplayOriginal:
    movzx eax, sourceArray[esi]      
    call WriteDec                    
    mov edx, OFFSET space
    call WriteString                
    add esi, TYPE WORD
    loop DisplayOriginal
    
    call Crlf                     

    mov esi, 0                      
    mov ecx, arraySize             

PushLoop:
    mov ax, sourceArray[esi]        
    push ax                        
    add esi, TYPE WORD             
    loop PushLoop

    ; Reset counter for popping
    mov ecx, arraySize              
    mov edi, 0                  

    ; Pop all elements from stack 
PopLoop:
    pop ax                        
    mov destArray[edi], ax         
    add edi, TYPE WORD            
    loop PopLoop
    mov edx, OFFSET copiedMsg
    call WriteString
    
    mov esi, 0
    mov ecx, arraySize
DisplayCopied:
    movzx eax, destArray[esi]      
    call WriteDec                  
    mov edx, OFFSET space
    call WriteString              
    add esi, TYPE WORD
    loop DisplayCopied
    
    call Crlf                    
main endp
end main
