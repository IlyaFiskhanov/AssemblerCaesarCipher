section .data
    message db 'Caesar',0
    len equ $-message

section .text
    global _start

_start:
    mov ecx, len 
    lea esi, [message] 
    xor eax, eax
    loop_start:
        cmp eax, ecx 
        jge loop_end
        mov bl, byte [esi+eax]
        add bl, 2
        mov byte [esi+eax], bl 
        inc eax 
        jmp loop_start 
    loop_end:
    mov edx, len
    mov ecx, message
    mov ebx, 1
    mov eax, 4
    int 0x80 
    mov eax, 1 
    xor ebx, ebx 
    int 0x80
