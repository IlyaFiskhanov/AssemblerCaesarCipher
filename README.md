Assembler Caesar Cipher

This repository contains assembly code that implements a Caesar cipher. The Caesar cipher is a simple substitution cipher where each letter in the plaintext is shifted a certain number of positions down the alphabet.

Code
The code is written in x86 assembly language and performs the Caesar cipher encryption on the message. Here's a breakdown of the code:

```asm
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

```


The code consists of two sections: .data and .text. The .data section declares the message string "HIKITALOX" and calculates its length using the $ symbol.

In the .text section, the program starts at the _start label. It initializes a counter (ecx) with the length of the message, loads the address of the message (esi) into a register, and sets the value of eax to 0.

The program then enters a loop (loop_start) that compares the counter (eax) with the length of the message. If the counter exceeds the length, it jumps to loop_end; otherwise, it continues the encryption process.

Within the loop, the program reads a byte from the memory location specified by esi+eax into the bl register. It adds 2 to the value of bl, effectively shifting the character two positions down the alphabet. The modified value is then stored back into memory.

After each iteration, the counter (eax) is incremented, and the program jumps back to loop_start to continue the process until all characters have been processed.

Once the encryption is complete, the program prepares the parameters for a system call to write the encrypted message to the standard output. It sets the length of the message (edx), the address of the message (ecx), the file descriptor for standard output (ebx), the system call number for write (eax), and triggers the system call interrupt (int 0x80).

Finally, the program exits gracefully by preparing the parameters for the system call to exit the program. It sets the exit status (eax) to 1 and triggers the system call interrupt again.

Usage
To run the code, assemble and link it using a suitable assembler and linker for your platform. 

Note: This code is specific to x86 architecture and assumes a Linux environment. If you are using a different architecture or operating system, you may need to modify the code accordingly.